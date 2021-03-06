//
//  BioViewModel.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 05.03.2021.
//

import Foundation

class BioViewModel {
    let bioData = Bio(
        imageName: "img",
        firstName: "Vasiliy",
        lastName: "Samarin",
        bio:
            """
            Software Engineer
            aiven92@gmail.com
            DOB: Jul/30/1992
            Nationality: Belarussian

            Areas of expertise:
            Linux, POSIX
            C, Make, git
            MCU — STM32, Milandr
            RTOS — FreeRTOS, NuttX
            KiCAD

            Interests:
            Swift, iOS/MacOS, Rust, Robotics, Operation Systems, Snowboarding


            Education:
            2016 — 2020
            Postgraduate Research
            Peter the Great St.Petersburg Polytechnic University
            Institute of Computing & Control
            Elements and devices of Computational Technics and Control Systems

            2014 — 2016
            Master of computer science
            Peter the Great St.Petersburg Polytechnic University
            Institute of Computing & Control
            Department of Computer Systems & Software Engineering
            Embedded control systems

            2010 — 2014
            Bachelor of computer science
            Peter the Great St.Petersburg Polytechnic University
            Institute of Computing & Control
            Department of Computer Systems & Software Engineering

            Experience:
            Sep 2018 — Nov 2020
            Software Engineer — Delorian
            Software development for internal vendin telemetry.
            Implemented two simultaneous network subsystems (gsm0710+PPP and SimCom internal interface)
            RTOS(NuttX) deep performance and memory profiling
            Implemented CI/CD integration to project
            Cashless payment systems collaboration
            Independently implemented two stage bootloader and main firmware for QR-display device (production > 10k)

            Dec 2017 — Present
            Engineer — Peter the Great St.Petersburg Polytechnic University
            Research in the field of embedded systems
            Developed hardware and software for  University internal needs
            Training sessions for students (C for Embedded)

            Jul 2016 — Jul 2017
            Engineer — ROBBO
            Developed mechanical / electronic parts and software for robotics education kit

            Sep 2017 — Mar 2018
            Jan 2016 — Jul 2016
            Sep 2015 — Dec 2015
            Hardware/Software Engineer — IBOOGUY / DaQuest / Quest service
            Developed and produced specific controllers for entertainment events

            Nov 2013 — Jun 2015
            QA Engineer(Hardware) — Simicon
            """)
    
    var fullName: String {
        var fullName = bioData.firstName
        
        if !bioData.lastName.isEmpty {
            fullName += " " + bioData.lastName
        }
        
        return fullName
    }
    
    var bio: String {
        return bioData.bio
    }
    
    var imageName: String {
        return bioData.imageName
    }
}
