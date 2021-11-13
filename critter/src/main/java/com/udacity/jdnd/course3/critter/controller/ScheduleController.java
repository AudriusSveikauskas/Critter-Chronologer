package com.udacity.jdnd.course3.critter.controller;

import com.udacity.jdnd.course3.critter.dto.ScheduleDTO;
import com.udacity.jdnd.course3.critter.entity.Employee;
import com.udacity.jdnd.course3.critter.entity.Pet;
import com.udacity.jdnd.course3.critter.entity.Schedule;
import com.udacity.jdnd.course3.critter.services.CustomerService;
import com.udacity.jdnd.course3.critter.services.EmployeeService;
import com.udacity.jdnd.course3.critter.services.PetService;
import com.udacity.jdnd.course3.critter.services.ScheduleService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Handles web requests related to Schedules.
 */
@RestController
@RequestMapping("/schedule")
public class ScheduleController {

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private PetService petService;

    @PostMapping
    public ScheduleDTO createSchedule(@RequestBody ScheduleDTO scheduleDTO) {
        Schedule schedule = new Schedule();
        List<Employee> employees = employeeService.findAllById(scheduleDTO.getEmployeeIds());
        List<Pet> pets = petService.findAllById(scheduleDTO.getPetIds());
        BeanUtils.copyProperties(scheduleDTO, schedule);
        schedule.setEmployeeIds(employees);
        schedule.setPetIds(pets);
        Schedule savedSchedule = scheduleService.save(schedule);

        employees.stream().forEach(employee -> {
            if (employee.getSchedules() == null) {
                employee.setSchedules(new ArrayList<>());
            }
            employee.getSchedules().add(savedSchedule);
        });

        pets.stream().forEach(pet -> {
            if (pet.getSchedules() == null) {
                pet.setSchedules(new ArrayList<>());
            }
            pet.getSchedules().add(savedSchedule);
        });

        return scheduleDTO;
    }

    @GetMapping
    public List<ScheduleDTO> getAllSchedules() {
        List<Schedule> schedules = scheduleService.findAll();
        return getScheduleDTOS(schedules);
    }

    @GetMapping("/pet/{petId}")
    public List<ScheduleDTO> getScheduleForPet(@PathVariable long petId) {
        List<Schedule> schedules = petService.findById(petId).getSchedules();
        return getScheduleDTOS(schedules);
    }

    @GetMapping("/employee/{employeeId}")
    public List<ScheduleDTO> getScheduleForEmployee(@PathVariable long employeeId) {
        Employee employee = employeeService.findById(employeeId);
        if (employee.getSchedules() == null) {
            return null;
        } else {
            List<Schedule> schedules = employee.getSchedules();
            return getScheduleDTOS(schedules);
        }
    }

    @GetMapping("/customer/{customerId}")
    public List<ScheduleDTO> getScheduleForCustomer(@PathVariable long customerId) {
        List<Pet> pets = customerService.findById(customerId).getPets();
        HashMap<Long, Schedule> hashMap = new HashMap<>();
        pets.stream().forEach(pet -> {
            pet.getSchedules().stream().forEach(schedule -> {
                hashMap.put(schedule.getId(), schedule);
            });
        });
        return getScheduleDTOS(new ArrayList<>(hashMap.values()));
    }

    private List<ScheduleDTO> getScheduleDTOS(List<Schedule> schedules) {
        return schedules.stream().map(schedule -> {
            ScheduleDTO scheduleDTO = new ScheduleDTO();
            BeanUtils.copyProperties(schedule, scheduleDTO);
            scheduleDTO.setEmployeeIds(schedule.getEmployeeIds().stream().map(employee -> {
                return employee.getId();
            }).collect(Collectors.toList()));
            scheduleDTO.setPetIds(schedule.getPetIds().stream().map(pet -> {
                return pet.getId();
            }).collect(Collectors.toList()));
            return scheduleDTO;
        }).collect(Collectors.toList());
    }

}
