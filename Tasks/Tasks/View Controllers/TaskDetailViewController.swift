//
//  TaskDetailViewController.swift
//  Tasks
//
//  Created by Andrew R Madsen on 8/11/18.
//  Copyright © 2018 Andrew R Madsen. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        self.setupAppearances()
    }

    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        
        let priorityIndex = priorityControl.selectedSegmentIndex
        let priority = TaskPriority.allPriorities[priorityIndex]
        let notes = notesTextView.text
        
        if let task = task {
            // Editing existing task
            taskController.update(task: task, with: name, notes: notes, priority: priority)
        } else {
            taskController.createTask(with: name, notes: notes, priority: priority)
        }

        navigationController?.popViewController(animated: true)
    }
    
    private func setupAppearances() {
        
        self.nameTextField.backgroundColor = .lightGray
        self.nameTextField.textColor = ApperanceHelper.midPurple
        
        self.notesTextView.backgroundColor = .lightGray
        self.notesTextView.textColor = ApperanceHelper.midPurple
        self.notesTextView.layer.borderColor = UIColor.white.cgColor
        self.notesTextView.layer.borderWidth = 0.5
        self.notesTextView.layer.cornerRadius = 8.0
        self.notesTextView.font = ApperanceHelper.typerighterFont(with: .body, pointSize: 28)
        
        self.notesTextView.keyboardAppearance = .dark
        
        self.view.backgroundColor = ApperanceHelper.lightLightGray
        
        self.priorityControl.backgroundColor = ApperanceHelper.lightLightGray
        
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
                
        title = task?.name ?? "Create Task"
        nameTextField.text = task?.name
        let priority: TaskPriority
        if let taskPriority = task?.priority {
            priority = TaskPriority(rawValue: taskPriority)!
        } else {
            priority = .normal
        }
        priorityControl.selectedSegmentIndex = TaskPriority.allPriorities.firstIndex(of: priority)!
        notesTextView.text = task?.notes
    }
    
    // MARK: Properties
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var taskController: TaskController!

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var priorityControl: UISegmentedControl!
    @IBOutlet var notesTextView: UITextView!
}
