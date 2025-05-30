﻿#language: ru

@tree

Функционал: добавление услуги в документ заказ

Как менеджер я хочу при добавлении услуги
проверить правильность отображения
суммы и количества документа заказа

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий:  добавление услуги в документ заказ 
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
* добавление услуги 
	Когда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000036" | "Услуги"       |
	И в таблице 'Список' я выбираю текущую строку
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И я перехожу к следующему реквизиту
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я добавляю строку
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыТовар'
	И в таблице 'Товары' я отменяю редактирование строки	
* Проверка 2 - заполнения табличной части. В поле количество можно ввести значение
	Тогда таблица 'Товары' содержит строки:
		| 'Товар'    | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Молоко'   | '40,00'  | '1'          | '40,00'  |
		| 'Доставка' | '200,00' | '20'           | '200,00' |
	
		
	