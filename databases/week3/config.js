const config = {
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USERNAME || 'root',
  password: process.env.DB_PASSWORD || '123',
  database: process.env.DB_NAME || 'hyf_database_hw3'
}

module.exports = config;
