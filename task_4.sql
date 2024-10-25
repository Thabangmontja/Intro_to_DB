-- File: task_4.sql
-- Script to print the full description of the books table

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE, COLUMN_DEFAULT, COLUMN_KEY
FROM information_schema.columns
WHERE table_schema = 'alx_book_store'
  AND table_name = 'books';
