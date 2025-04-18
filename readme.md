1. PostgreSQL কী?
   সংজ্ঞা: PostgreSQL হলো একটি ওপেন-সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)।
   বর্ণনা: এটি ডেটা সংরক্ষণ, পরিচালনা ও পুনরুদ্ধারের জন্য ব্যবহৃত হয়। এটি শক্তিশালী, নিরাপদ এবং বড় আকারের অ্যাপ্লিকেশনের জন্য উপযোগী।

2. PostgreSQL-এ ডেটাবেস স্কিমার উদ্দেশ্য কী?
   সংজ্ঞা: স্কিমা হলো একটি ডেটাবেসের ভিতরে সংগঠিত কাঠামো।
   বর্ণনা: এটি টেবিল, ভিউ, ফাংশন ইত্যাদিকে গুচ্ছ করে রাখে। এতে একই ডেটাবেসে আলাদা আলাদা মডিউল বা ব্যবহারকারী ডেটা আলাদাভাবে রাখা যায়।

3. Primary Key ও Foreign Key কী?
   Primary Key:
   একটি টেবিলে যেই কলামটি প্রতিটি রেকর্ডকে ইউনিকভাবে চিহ্নিত করে।
   Foreign Key:
   একটি টেবিলে এমন একটি কলাম যা অন্য একটি টেবিলের Primary Key-কে রেফারেন্স করে।

4. VARCHAR এবং CHAR ডেটা টাইপের মধ্যে পার্থক্য কী?
   CHAR(n): নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং; কম হলে ফাঁকা জায়গায় ভরাট হয়।
   VARCHAR(n): সর্বোচ্চ দৈর্ঘ্য নির্ধারিত, তবে যতটুকু লাগে ততটুকু স্থান নেয়।
   সারাংশ: VARCHAR বেশি ফ্লেক্সিবল, CHAR বেশি নির্ধারিত।

5. SELECT স্টেটমেন্টে WHERE ক্লজের উদ্দেশ্য কী?
   সংজ্ঞা: WHERE ক্লজ শর্ত নির্ধারণ করে।
   বর্ণনা: এটি দিয়ে নির্দিষ্ট শর্ত অনুযায়ী রেকর্ড বাছাই করা যায়।
   যেমন: SELECT \* FROM students WHERE age > 18;

6. LIMIT ও OFFSET ক্লজ কী কাজে লাগে?
   LIMIT: কতগুলো রেকর্ড আনবে তা নির্ধারণ করে।
   OFFSET: শুরুতে কয়টি রেকর্ড বাদ দেবে তা নির্ধারণ করে।
   উদাহরণ: SELECT \* FROM users LIMIT 10 OFFSET 5;

7. UPDATE স্টেটমেন্ট দিয়ে কীভাবে ডেটা পরিবর্তন করা যায়?
   ব্যবহার: নির্দিষ্ট রেকর্ডের মান পরিবর্তন করতে।
   উদাহরণ: UPDATE students SET age = 20 WHERE id = 1;

8. JOIN অপারেশনের গুরুত্ব ও কাজ কী?
   সংজ্ঞা: JOIN দুই বা ততোধিক টেবিলকে যুক্ত করে।
   বর্ণনা: ডেটার সম্পর্ক ব্যবহার করে একাধিক টেবিল থেকে মিলিত রেকর্ড বের করা যায়।
   উদাহরণ: SELECT \* FROM orders
   JOIN customers ON orders.customer_id = customers.id;

9. GROUP BY ক্লজ এবং এটি কীভাবে অ্যাগ্রিগেশন অপারেশনে সাহায্য করে?
   সংজ্ঞা: GROUP BY এক বা একাধিক কলাম অনুযায়ী ডেটাকে গ্রুপ করে।
   বর্ণনা: এটি অ্যাগ্রিগেট ফাংশনের সাথে ব্যবহৃত হয় যেমন SUM(), AVG(), ইত্যাদি।
   উদাহরণ: SELECT department, AVG(salary)
   FROM employees
   GROUP BY department;

10. COUNT(), SUM(), AVG() কীভাবে ব্যবহার করা যায়?
    ব্যাখ্যা:
    COUNT(): রেকর্ড সংখ্যা গণনা করে।
    SUM(): নির্দিষ্ট কলামের মোট যোগফল।
    AVG(): গড় মান হিসাব করে।
    উদাহরণ: SELECT COUNT(\*), SUM(salary), AVG(salary)
    FROM employees;
