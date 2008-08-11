module RPoint
	module Types
		module Lists
		  
		  TEMPLATES = [
		    ['AdminTasks'           , 'Administrator Tasks'       , 1200  ],
        ['Agenda'               , 'Agenda (Meeting)'          , 201   ],
        ['Announcements'        , 'Announcements'             , 104   ],
        ['Categories'           , 'Categories (Blog)'         , 303   ],
        ['Comments'             , 'Comments (Blog)'           , 302   ],
        ['Contacts'             , 'Contacts'                  , 105   ],
        ['CustomGrid'           , 'Custom grid for a list'    , 120   ],
        ['DataConnectionLibrary', 'Data connection library for sharing information about external data connections',  130],
        ['DataSources'          , 'Data sources for a site'   , 110   ],
        ['Decision'             , 'Decisions (Meeting)'       , 204   ],
        ['DiscussionBoard'      , 'Discussion board'          , 108   ],
        ['DocumentLibrary'      , 'Document library'          , 101   ],
        ['Events'               , 'Calendar'                  , 106   ],
        ['GanttTasks'           , 'Project Tasks'             , 150   ],
        ['GenericList'          , 'Custom list'               , 100   ],
        ['HomePageLibrary'      , 'Workspace Pages (Meeting)' , 212   ],
        ['IssueTracking'        , 'Issue tracking'            , 1100  ],
        ['Links'                , 'Links'                     , 103   ],
        ['ListTemplateCatalog'  , 'List Template gallery'     , 114   ],
        ['MasterPageCatalog'    , 'Master Page gallery'       , 116   ],
        ['MeetingObjective'     , 'Objectives (Meeting)'      , 207   ],
        ['Meetings'             , 'Meeting Series (Meeting)'  , 200   ],
        ['MeetingUser'          , 'Attendees (Meeting)'       , 202   ],
        ['NoCodeWorkflows'      , 'No Code Workflows'         , 117   ],
        ['PictureLibrary'       , 'Picture library'           , 109   ],
        ['Posts'                , 'Posts (Blog)'              , 301   ],
        ['Survey'               , 'Survey'                    , 102   ],
        ['Tasks'                , 'Tasks'                     , 107   ],
        ['TextBox'              , 'Text Box (Meeting)'        , 210   ],
        ['ThingsToBring'        , 'Things To Bring (Meeting)' , 211   ],
        ['UserInformation'      , 'User Information'          , 112   ],
        ['WebPageLibrary'       , 'Wiki Page Library'         , 119   ],
        ['WebPartCatalog'       , 'Web Part gallery'          , 113   ],
        ['WebTemplateCatalog'   , 'Site template gallery'     , 111   ],
        ['WorkflowHistory'      , 'Workflow History'          , 140   ],
        ['WorkflowProcess'      , 'Custom Workflow Process'   , 118   ],
        ['XMLForm'              , 'XML Form library'          , 115   ]
		  ]
		  
		  TEMPLATES.each do |template|
		    class_eval <<-END
		      class #{template[0]}
		        def self.id
		          #{template[2]}
	          end
	          
	          def self.description
	            '#{template[1]}'
	          end
          end
	      END
	        
	    end
	    
		end
	end
end

# create easy references to types
RPoint::Types::Lists::TEMPLATES.each do |template|
  eval "#{template[0]} = RPoint::Types::Lists::#{template[0]}"
end