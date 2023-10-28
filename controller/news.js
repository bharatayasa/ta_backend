const axios = require('axios');
const cheerio = require('cheerio');

module.exports = {
    newsLokal : async (req, res) => {
        try {
        const response = await axios.get('https://www.detik.com/tag/petani?tag_from=pertanian');
        const $ = cheerio.load(response.data);

        const results = [];
        $('article').each((index, element) => {
            const title = $(element).find('h2.title').text().trim();
            const url = $(element).find('a').attr('href');
            const date = $(element).find('.date').text().trim();
            const image = $(element).find('.box_thumb img').attr('src');
            const category = $(element).find('.category').text().trim();

            results.push({
            title,
            url,
            image,
            date,
            category,
            });
        });

        res.json(results);
        } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'An error occurred' });
        }
    },

    newsinter : async (req, res) => {
        try {
        const response = await axios.get('https://agfundernews.com/?s=tomato');
        const $ = cheerio.load(response.data);
    
        const results = [];
        $('article.elementor-post').each((index, element) => {
            const title = $(element).find('h3.elementor-post__title a').text().trim();
            const url = $(element).find('h3.elementor-post__title a').attr('href');
            const image = $(element).find('img').attr('src');
            const date = $(element).find('.elementor-post-date').text().trim();
            const excerpt = $(element).find('.elementor-post__excerpt').text().trim();

            results.push({
            title,
            url,
            image,
            date,
            excerpt,
            });
        });

        res.json(results);
        } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'An error occurred' });
        }
    }
}
