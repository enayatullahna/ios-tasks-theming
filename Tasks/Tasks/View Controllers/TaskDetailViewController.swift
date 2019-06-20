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
        
        self.nameTextField.backgroundColor = ApperanceHelper.replaceLightgray
        self.nameTextField.textColor = ApperanceHelper.midPurple
        
        self.notesTextView.backgroundColor = ApperanceHelper.replaceLightgray
        self.notesTextView.textColor = ApperanceHelper.midPurple
        self.notesTextView.layer.borderColor = UIColor.white.cgColor
        self.notesTextView.layer.borderWidth = 0.5
        self.notesTextView.layer.cornerRadius = 8.0
        self.notesTextView.font = ApperanceHelper.typerighterFont(with: .body, pointSize: 28)
        
        self.notesTextView.keyboardAppearance = .dark
        
        self.view.backgroundColor = ApperanceHelper.lightLightGray
        
        self.priorityControl.backgroundColor = ApperanceHelper.lightLightGray
        
        self.nameLabel.textColor = ApperanceHelper.midPurple
        self.nameLabel.font = ApperanceHelper.typerighterFont(with: .body, pointSize: 22)
        
        self.priorityLabel.textColor = ApperanceHelper.midPurple
        self.priorityLabel.font = ApperanceHelper.typerighterFont(with: .body, pointSize: 22)
        
        self.notesLabel.textColor = ApperanceHelper.midPurple
        self.notesLabel.font = ApperanceHelper.typerighterFont(with: .body, pointSize: 22)
        
        
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

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var priorityControl: UISegmentedControl!
    @IBOutlet var notesTextView: UITextView!
}
