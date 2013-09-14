require 'time'

module YARD
  module SitemapGenerator
    module_function

    # Generates a sitemap at +basedir+
    # @param basedir [String] the location where the sitemap should be generated
    def generate_sitemap(basedir)
      sitemap_file = File.join(basedir, 'sitemap.xml')
      File.open(sitemap_file, 'w') do |file|
        file.write(sitemap_contents(basedir))
      end
    end

    # @param basedir [String] the location where the sitemap should be generated
    # @return [String] the sitemap.xml contents
    def sitemap_contents(basedir)
      data = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
      data << "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\"\n"
      data << "    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n"

      Dir.glob(basedir + '/**/*.html').each do |file|
        next unless File.file?(file)
        mtime = File.mtime(file)
        fname = file.sub(/^#{Regexp.quote basedir}\//, '')
        data << "  <url>\n"
        data << "    <loc>#{fname}</loc>\n"
        data << "    <lastmod>#{mtime.iso8601}</lastmod>\n"
        data << "  </url>\n"
      end

      data << "</urlset>\n"
      data
    end
  end

  module CLI
    class Yardoc
      include SitemapGenerator

      def run_generate_with_sitemap(*args)
        run_generate_without_sitemap(*args)
        generate_sitemap(options.serializer.basepath)
      end

      alias run_generate_without_sitemap run_generate
      alias run_generate run_generate_with_sitemap
    end
  end
end
