-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Ago-2024 às 02:51
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `class`
--

CREATE TABLE `class` (
  `idClass` int(11) NOT NULL,
  `descriptionClass` varchar(100) NOT NULL,
  `quantityStudents` int(11) NOT NULL,
  `Course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `course`
--

CREATE TABLE `course` (
  `idCourse` int(11) NOT NULL,
  `nameCourse` varchar(45) NOT NULL,
  `area` varchar(45) NOT NULL,
  `full_load` varchar(45) NOT NULL,
  `descriptionCourse` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `discipline`
--

CREATE TABLE `discipline` (
  `idDiscipline` int(11) NOT NULL,
  `nameDiscipline` varchar(45) NOT NULL,
  `workload` varchar(45) NOT NULL,
  `description_discipline` varchar(100) NOT NULL,
  `Teacher_idTeacher` int(11) NOT NULL,
  `Course_idCourse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `registration`
--

CREATE TABLE `registration` (
  `idRegistration` int(11) NOT NULL,
  `date_registration` int(11) NOT NULL,
  `Student_idStudent` int(11) NOT NULL,
  `Class_idClass` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `student`
--

CREATE TABLE `student` (
  `idStudent` int(11) NOT NULL,
  `nameStudent` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `education` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `teacher`
--

CREATE TABLE `teacher` (
  `idTeacher` int(11) NOT NULL,
  `nameTeacher` varchar(45) NOT NULL,
  `speciality` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `wage` float NOT NULL,
  `sex` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`idClass`),
  ADD KEY `fk_class_course` (`Course_id`);

--
-- Índices para tabela `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`idCourse`);

--
-- Índices para tabela `discipline`
--
ALTER TABLE `discipline`
  ADD PRIMARY KEY (`idDiscipline`),
  ADD KEY `fk_dis_teacher` (`Teacher_idTeacher`),
  ADD KEY `fk_dis_course` (`Course_idCourse`);

--
-- Índices para tabela `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`idRegistration`),
  ADD KEY `fk_res_student` (`Student_idStudent`),
  ADD KEY `fk_res_class` (`Class_idClass`);

--
-- Índices para tabela `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`idStudent`);

--
-- Índices para tabela `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`idTeacher`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `course`
--
ALTER TABLE `course`
  MODIFY `idCourse` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `discipline`
--
ALTER TABLE `discipline`
  MODIFY `idDiscipline` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `registration`
--
ALTER TABLE `registration`
  MODIFY `idRegistration` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `student`
--
ALTER TABLE `student`
  MODIFY `idStudent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `teacher`
--
ALTER TABLE `teacher`
  MODIFY `idTeacher` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `fk_class_course` FOREIGN KEY (`Course_id`) REFERENCES `course` (`idCourse`);

--
-- Limitadores para a tabela `discipline`
--
ALTER TABLE `discipline`
  ADD CONSTRAINT `fk_dis_course` FOREIGN KEY (`Course_idCourse`) REFERENCES `course` (`idCourse`),
  ADD CONSTRAINT `fk_dis_teacher` FOREIGN KEY (`Teacher_idTeacher`) REFERENCES `teacher` (`idTeacher`);

--
-- Limitadores para a tabela `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `fk_res_class` FOREIGN KEY (`Class_idClass`) REFERENCES `class` (`idClass`),
  ADD CONSTRAINT `fk_res_student` FOREIGN KEY (`Student_idStudent`) REFERENCES `student` (`idStudent`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
