#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

hu_names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://hu.wikipedia.org/wiki/2014%E2%80%932018_k%C3%B6z%C3%B6tti_magyar_orsz%C3%A1ggy%C5%B1l%C3%A9si_k%C3%A9pvisel%C5%91k_list%C3%A1ja',
  after: '//h2[span[@id="K.C3.A9pvisel.C5.91k"]]',
  before: '//h2[span[@id="Nemzetis.C3.A9gi_sz.C3.B3sz.C3.B3l.C3.B3k"]]',
  xpath: './/ul/li/a[not(@class="new")]/@title',
) 

en_names = WikiData::Category.new( 'Category:Members of the National Assembly of Hungary (2014–18)', 'en').member_titles

EveryPolitician::Wikidata.scrape_wikidata(names: { hu: hu_names, en: en_names }, output: false)
warn EveryPolitician::Wikidata.notify_rebuilder

