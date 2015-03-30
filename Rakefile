task :default do
  file = 'skalera-dev-1.1.2.box'
  sh 'packer build dev.json'
  FileUtils.mv('skalera-dev.box', file)
  sh "s3cmd --acl-public put #{file} s3://skalera/vagrant/"
end
