-- Gilder

update conway set cell = 0;

update conway set cell = 1 where x = 1 and y = 3;
update conway set cell = 1 where x = 2 and y = 3;
update conway set cell = 1 where x = 3 and y = 3;
update conway set cell = 1 where x = 3 and y = 2;
update conway set cell = 1 where x = 2 and y = 1;