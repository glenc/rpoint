module RPoint
	module Types
		module Sites
		  
		  TEMPLATES = [
		    ['TeamSite'                   , 'STS#0'             ],
		    ['BlankSite'                  , 'STS#1'             ],
		    ['DocumentWorkspace'          , 'STS#2'             ],
		    ['WikiSite'                   , 'WIKI#0'            ],
		    ['Blog'                       , 'BLOG#0'            ],
		    ['BasicMeetingWorkspace'      , 'MPS#0'             ],
		    ['BlankMeetingWorkspace'      , 'MPS#1'             ],
		    ['DecisionMeetingWorkspace'   , 'MPS#2'             ],
		    ['SocialMeetingWorkspace'     , 'MPS#3'             ],
		    ['MultiPageMeetingWorkspace'  , 'MPS#4'             ],
		    ['DocumentCenter'             , 'BDR#0'             ],
		    ['RecordsCenter'              , 'OFFILE#1'          ],
		    ['PersonalizationSite'        , 'SPSMSITE#0'        ],
		    ['SiteDirectory'              , 'SPSITES#0'         ],
		    ['ReportCenter'               , 'SPREPORTCENTER#0'  ],
		    ['SearchCenterWithTabs'       , 'SRCHCEN#0'         ],
		    ['SearchCenter'               , 'SRCHCENTERLITE#0'  ],
		    ['PublishingSite'             , 'CMSPUBLISHING#0'   ],
		    ['PublishingSiteWithWorkflow' , 'BLANKINTERNET#2'   ],
		    ['NewsSite'                   , 'SPSNHOME#0'        ],
		    ['SSPAdmin'                   , 'OSRV#0'            ],
		    ['MySite'                     , 'SPSPERS#0'         ]
		  ]
		  
		  TEMPLATES.each do |template|
		    class_eval <<-END
		      class #{template[0]}
		        def self.id
		          '#{template[1]}'
	          end
          end
	      END
  	      
	    end
	    
		end
	end
end
