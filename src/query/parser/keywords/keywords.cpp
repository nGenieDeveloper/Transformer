/**
* the keywords definition.
* path: query/parser/keywords/keywords.cpp
*/

#include <string.h>

#include <keywords/keywords.h>
#include <parser/parserGramm.h>

namespace Transformer {
namespace ParserN{

scan_keyword_t KeyWord::scanKeyWordsList_[] ={
	TRANS_KEYWORD("select",SELECT,RESERVED_KEYWORD)
};

ScanKeyWord
KeyWord::KeyWordLookup (const char* keyword, const ScanKeyWord keywords_list, int number_keywords )
{
	char		word[64];
	ScanKeyWord low = NULL;
	ScanKeyWord high = NULL;

	int len = strlen(keyword);
	if (len >= 64)
		return NULL;

	/*
	 * Apply an ASCII-only downcasing.  We must not use tolower() since it may
	 * produce the wrong translation in some locales (eg, Turkish).
	 */
	for (int i = 0; i < len; i++)
	{
		char		ch = keyword[i];

		if (ch >= 'A' && ch <= 'Z')
			ch += 'a' - 'A';
		word[i] = ch;
	}
	word[len] = '\0';

	/*
	 * Now do a binary search using plain strcmp() comparison.
	 */
	low = keywords_list;
	high = keywords_list + (number_keywords - 1);
	while (low <= high)
	{
		ScanKeyWord middle ;
		int			difference;

		middle = low + (high - low) / 2;
		difference = strcmp(middle->key_name_, word);
		if (difference == 0)
			return middle;
		else if (difference < 0)
			low = middle + 1;
		else
			high = middle - 1;
	}

	return NULL;
}


}//ParserN.
}//Transformer 
