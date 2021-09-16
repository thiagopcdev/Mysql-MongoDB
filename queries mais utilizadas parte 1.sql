#1 - Escreva uma query que exiba o maior salário da tabela.
SELECT 
    MAX(salary)
FROM
    hr.employees;

#2 - Escreva uma query que exiba a diferença entre o maior e o menor salário.
SELECT 
    MAX(salary) - MIN(salary) as diff
FROM
    hr.employees;
    
#3 - Escreva uma query que exiba a média salarial de cada JOB_ID , ordenando pela média salarial 
#em ordem decrescente.

SELECT 
    job_id, AVG(salary) AS 'average_salary'
FROM
    hr.employees
GROUP BY job_id
ORDER BY 'average_salary' DESC;

#4. Escreva uma query que exiba a quantidade de dinheiro necessária para realizar o pagamento de
# todas as pessoas funcionárias.

SELECT 
    SUM(SALARY)
FROM
    hr.employees;
    
#5. Escreva uma query que exiba quatro informações: o maior salário, o menor salário, a soma de 
#todos os salários e a média dos salários.Todos os valores devem ser formatados para ter 
#apenas duas casas decimais.

SELECT 
    MAX(SALARY), MIN(SALARY), SUM(SALARY), ROUND(AVG(SALARY), 2)
FROM
    hr.employees;
    
#6. Escreva uma query que exiba a quantidade de pessoas que trabalham como pessoas programadoras
# ( IT_PROG ).

SELECT 
    job_id, count(*) as total
FROM
    hr.employees
WHERE job_id = 'IT_PROG';

#7. Escreva uma query que exiba a quantidade de dinheiro necessária para efetuar o pagamento de 
#cada profissão ( JOB_ID ).

SELECT 
    job_id, SUM(salary) as Salarios_Setor
FROM
    hr.employees
GROUP BY job_id;

#8. Utilizando a query anterior, faça as alterações para que seja exibido somente a quantidade 
#de dinheiro necessária para cobrir a folha de pagamento das pessoas programadoras ( IT_PROG ).

SELECT 
    job_id, SUM(salary) as Salarios_Setor
FROM
    hr.employees
GROUP BY job_id
HAVING job_id = 'IT_PROG';

#9. Escreva uma query que exiba em ordem decrescente a média salarial de todos os cargos, 
#exceto das pessoas programadoras ( IT_PROG ).

SELECT 
    job_id, ROUND(AVG(salary),2) as Media_Salario
FROM
    hr.employees
GROUP BY job_id
HAVING job_id <> 'IT_PROG'
ORDER BY Media_Salario DESC;

#10. Escreva um query que exiba média salarial e o número de funcionários de todos os 
#departamentos com mais de dez funcionários. Dica: agrupe pelo department_id .

SELECT 
    ROUND(AVG(salary),2) as media_salario,
    COUNT(*) as qnt_func
FROM
    hr.employees
GROUP BY DEPARTMENT_ID
HAVING qnt_func > 10;

#11. Escreva uma query que atualize a coluna PHONE_NUMBER , de modo que todos os telefones 
#iniciados por 515 agora devem iniciar com 777.

UPDATE hr.employees 
SET 
    PHONE_NUMBER = REPLACE(PHONE_NUMBER, '515', '777')
WHERE
    PHONE_NUMBER LIKE '515%';

#12. Escreva uma query que só exiba as informações dos funcionários cujo o primeiro nome 
#tenha oito ou mais caracteres.

SELECT 
    *
FROM
    hr.employees
WHERE char_length(first_name) >= 8;

#13. Escreva uma query que exiba as seguintes informações de cada funcionário: id , 
#primeiro nome e ano no qual foi contratado (exiba somente o ano).

SELECT 
    EMPLOYEE_ID, FIRST_NAME, YEAR(HIRE_DATE)
FROM
    hr.employees;
    
    #OU
    
SELECT employee_id, first_name,
    LEFT(hire_date, 4) 'hire_year'
FROM hr.employees;

	#OU
    
SELECT employee_id, first_name,
    MID(hire_date, 1, 4) 'hire_year'
FROM hr.employees;

#14. Escreva uma query que exiba as seguintes informações de cada funcionário: id , primeiro 
#nome e dia do mês no qual foi contratado (exiba somente o dia).

SELECT 
    EMPLOYEE_ID, FIRST_NAME, DAY(HIRE_DATE)
FROM
    hr.employees;
    
    #OU
    
SELECT employee_id, first_name,
    RIGHT(hire_date, 2) 'hire_day'
FROM hr.employees;

	#OU

SELECT employee_id, first_name,
    MID(hire_date, 9, 2) 'hire_day'
FROM hr.employees;

#15. Escreva uma query que exiba as seguintes informações de cada funcionário: id , primeiro nome
# e mês no qual foi contratado (exiba somente o mês).

SELECT 
    EMPLOYEE_ID, FIRST_NAME, MONTH(HIRE_DATE)
FROM
    hr.employees;
    
    #OU

SELECT employee_id, first_name,
    SUBSTRING(hire_date, 6, 2) 'hire_month'
FROM hr.employees;

#16. Escreva uma query que exiba os nomes dos funcionários em letra maiúscula.

SELECT 
	UPPER(CONCAT(first_name," ",last_name))
FROM hr.employees;

#17: Escreva uma query que exiba o sobrenome e a data de contratação de todos os funcionário
# contratados em julho de 1987.

SELECT 
	last_name, hire_date
FROM hr.employees
WHERE hire_date LIKE '1987-06%';

	#OU
    
SELECT LAST_NAME _NAME, HIRE_DATE
FROM hr.employees
WHERE HIRE_DATE  BETWEEN '1987-07-01'  AND '1987-07-31';

	#OU
    
SELECT LAST_NAME _NAME, HIRE_DATE
FROM hr.employees
WHERE MONTH(HIRE_DATE)=7 and YEAR(HIRE_DATE)=1987;

#18: Escreva uma query que exiba as seguintes informações de cada funcionário: nome , 
#sobrenome , tempo que trabalha na empresa (em dias) .

SELECT 
	first_name, last_name, datediff(now(), hire_date) 'days_worked'
FROM hr.employees;

	#OU
    
SELECT first_name,
    last_name,
    DATEDIFF(CURRENT_DATE() , HIRE_DATE) 'days_worked'
FROM hr.employees;

