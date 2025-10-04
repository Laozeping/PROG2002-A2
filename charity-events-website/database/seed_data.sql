USE charityevents_db;

-- Insert organization data
INSERT INTO organizations (name, description, mission_statement, contact_email, contact_phone, address) VALUES
('Hope Light Charity Foundation', 'Dedicated to helping underprivileged children and families improve their living conditions', 'Creating a better future for vulnerable groups through education and community support', 'contact@hopelight.org', '+61 2 1234 5678', '123 Charity Street, Sydney NSW 2000'),
('Care Aid Organization', 'Non-profit organization focused on medical assistance and health promotion', 'Ensuring everyone has access to basic medical services and health knowledge', 'info@careaid.org', '+61 3 9876 5432', '456 Hope Avenue, Melbourne VIC 3000');

-- Insert category data
INSERT INTO categories (name, description) VALUES
('Gala Dinner', 'Formal charity dinner events'),
('Fun Run', 'Fun run fundraising events'),
('Silent Auction', 'Silent auction events'),
('Concert', 'Charity concert events'),
('Workshop', 'Educational and workshop events'),
('Community Fair', 'Community fair events');

-- Insert event data (10 samples)
INSERT INTO events (title, description, full_description, category_id, organization_id, event_date, location, venue_details, ticket_price, goal_amount, current_amount, max_attendees, image_url) VALUES
('Hope Light Annual Charity Gala', 'Grand annual fundraising dinner', 'Join us for this unforgettable evening featuring exquisite dining, inspiring speeches, and wonderful entertainment. All proceeds will support education programs for underprivileged children.', 1, 1, '2025-10-15 18:30:00', 'Sydney Convention Centre', 'Grand Ballroom, Level 3', 150.00, 50000.00, 32500.00, 300, '/images/Hope Light Annual Charity Gala.jpg'),
('Urban Fun Run 2025', '5km fun run event', 'Put on your running shoes and join our 5km fun run! Suitable for all ages and fitness levels. Includes T-shirt, medal, and post-race refreshments.', 2, 2, '2025-09-20 08:00:00', 'Centennial Park', 'Main Entrance, Federation Way', 25.00, 20000.00, 12500.00, 500, '/images/Urban Fun Run 2025.jpg'),
('Art Treasures Auction', 'Exclusive art treasures auction evening', 'Experience a unique art night bidding on exclusive works from local and international artists. Includes cocktails and appetizers.', 3, 1, '2025-11-05 19:00:00', 'Art Gallery of Sydney', 'Modern Art Wing', 75.00, 30000.00, 18000.00, 150, '/images/Artwork Auction.jpg'),
('Care Concert', 'Charity concert by local musicians', 'Enjoy an evening of classical and contemporary music performed by renowned local musicians. All proceeds will go towards medical equipment purchases.', 4, 2, '2025-10-28 19:30:00', 'Sydney Opera House', 'Utzon Room', 60.00, 15000.00, 8900.00, 200, '/images/Love Concert.jpg'),
('Children Coding Education', 'Free programming education course', 'A one-day introductory programming workshop teaching children basic programming concepts and creative thinking.', 5, 1, '2025-09-12 10:00:00', 'University of Technology Sydney', 'Building 11, Room 302', 0.00, 5000.00, 3200.00, 30, '/images/Childrens programming education.jpg'),
('Autumn Community Fair', 'Family-friendly community fair', 'Enjoy food, crafts, games, and entertainment. A wonderful weekend activity for the whole family.', 6, 1, '2025-09-25 10:00:00', 'Hyde Park', 'North of Archibald Fountain', 5.00, 8000.00, 4500.00, 1000, '/images/Autumn Community Fair.jpg'),
('Healthy Living Seminar', 'Nutrition and healthy living education', 'Learn how to improve quality of life through healthy eating and lifestyle. Includes healthy lunch and information package.', 5, 2, '2025-10-10 09:00:00', 'Royal Botanic Garden', 'The Calyx, Mrs Macquaries Road', 20.00, 6000.00, 3800.00, 80, '/images/Health Lifestyle Seminar.jpg'),
('Winter Charity Ball', 'Formal winter ball fundraising event', 'Put on your finest attire and join our Winter Charity Ball. Includes dinner, dancing, and raffle activities.', 1, 2, '2025-06-20 19:00:00', 'The Star Hotel', 'Crystal Ballroom', 120.00, 40000.00, 28500.00, 250, '/images/Winter charity ball.jpg'),
('Beach Cleanup Day', 'Community beach cleaning environmental activity', 'Join our beach cleanup activity to protect the marine environment. Gloves, bags, and refreshments provided.', 6, 1, '2025-08-15 09:00:00', 'Bondi Beach', 'South End, near Icebergs', 0.00, 2000.00, 1500.00, 100, '/images/Beach Cleanup Day.jpg'),
('Photography Exhibition Fundraising', 'Charity photography exhibition', 'Admire and purchase beautiful works by local photographers. All sales proceeds will be donated to charity projects.', 3, 2, '2025-07-22 10:00:00', 'Paddington Arts District', '45 Oxford Street Gallery', 10.00, 12000.00, 7500.00, 120, '/images/Photography Exhibition Fundraising.jpg');

UPDATE events SET image_url = '/images/event1.jpg' WHERE id = 1;
UPDATE events SET image_url = '/images/event2.jpg' WHERE id = 2;
UPDATE events SET image_url = '/images/event3.jpg' WHERE id = 3;
UPDATE events SET image_url = '/images/event4.jpg' WHERE id = 4;
UPDATE events SET image_url = '/images/event5.jpg' WHERE id = 5;
UPDATE events SET image_url = '/images/event6.jpg' WHERE id = 6;
UPDATE events SET image_url = '/images/event7.jpg' WHERE id = 7;
UPDATE events SET image_url = '/images/event8.jpg' WHERE id = 8;
UPDATE events SET image_url = '/images/event9.jpg' WHERE id = 9;
UPDATE events SET image_url = '/images/event10.jpg' WHERE id = 10;