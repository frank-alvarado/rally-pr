import sys

from pyral import Rally, rallyWorkset

options = [opt for opt in sys.argv[1:] if opt.startswith('--')]
args    = [arg for arg in sys.argv[1:] if arg not in options]
server, user, password, apikey, workspace, project = rallyWorkset(options)
rally = Rally(server, user, password, apikey=apikey, workspace=workspace, project=project)
rally.enableLogging('rally.pr.log')

query_criteria = 'FormattedID = "%s"' % args[0]
response = rally.get('UserStory', fetch=True, query=query_criteria)

story1 = response.next()
print(str(story1.oid) + ";" + story1.Name)