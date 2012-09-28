# encoding: UTF-8
class Apk < ActiveRecord::Base

  scope :latest, lambda { select('apks.id, apks.name, apks.version').
    joins("inner join" +
          "(select name, max(version) as version from apks where created_at > '1970-01-01 00:00:00.000000' group by name)" +
          "as a on apks.name = a.name and apks.version = a.version where apks.created_at > '1970-01-01 00:00:00.000000' group by apks.name")}

  has_attached_file :file

  ZN_NAME = "软件"
  
  def self.zh_name
    ZN_NAME
  end

  def parse_info
    res = `java -jar app/models/APKParser.jar #{self.file.path}`

    version_name_string = res.match(/versionName=\"([^\"]*)\"/)
    version_string = res.match(/versionCode=\"([^\"]*)\"/)
    name_string = res.match(/package=\"([^\"]*)\"/)
    
    self.version_name = version_name_string.captures[0] if version_name_string
    self.version = version_string.captures[0].to_i if version_string
    self.name = name_string.captures[0] if name_string
    
  end
end
