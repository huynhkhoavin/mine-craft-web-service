DELIMITER $$

CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    PROCEDURE `mine_craft_mods`.`buy_coin_by_money`(
	IN p_pc_id INT(11),
	IN p_user_id VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
	IN p_order_id TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci
    )
    BEGIN
	SELECT `pc_coin_value` FROM `purchase_constant` WHERE `purchase_constant`.`pc_id` = p_pc_id INTO @value;
	SELECT COUNT(*) FROM `transaction` WHERE `transaction`.`order_id` = p_order_id INTO @check_order_id;
	IF(@check_order_id = 0) THEN
		
	ELSE
	
	END IF; 
    END$$

DELIMITER ;