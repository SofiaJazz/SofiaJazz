﻿#language: ru

@tree

Функционал: создание документа заказа 

Как менеджер я хочу
проверить правильность отображения
суммы и количества документа заказа

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий:  создание документа заказа 
* открытие документа формыи создание заказа
	И В командном интерфейсе я выбираю "Продажи" "Заказ"
	Тогда открылось окно "Заказ (создание)"
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"Товары\""
	И из выпадающего списка с именем 'Покупатель' я выбираю точное значение "Мосхлеб ОАО"
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Малый"
	Когда открылось окно "Заказ (создание) *"
* заполнение товарной части	
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю точное значение "Молоко"
	И я перехожу к следующему реквизиту
	Когда открылось окно "Заказ (создание) *"
	И я перехожу к следующему реквизиту
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я завершаю редактирование строки
* Проверка 1 - заполнения табличной части. Позиция цены и количества
	Тогда таблица 'Товары' содержит строки:
		| 'Цена'  | 'Количество' |
		| '40,00' | '1'          |
	И я нажимаю на кнопку "Записать"
		