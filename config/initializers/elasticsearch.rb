require 'elasticsearch/model'
host = ENV.fetch("ELASTICSEARCH_HOST") { 'http://localhost:9200' }
client = Elasticsearch::Client.new log:true, url: host, transport_options: { request: { timeout: 5 }, ssl: { verify: false } }
client.cluster.health

Elasticsearch::Model.client = client