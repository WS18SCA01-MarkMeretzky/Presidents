//
//  PresidentsTableViewController.swift
//  Presidents
//
//  Created by Mark Meretzky on 3/26/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class PresidentsTableViewController: UITableViewController {
    
    var model: [String] = [String]();
    
    let presidents: Set<String> = [
        "George Washington",      // 1
        "John Adams",             // 2
        "Thomas Jefferson",       // 3
        "James Madison",          // 4
        "James Monroe",           // 5
        "John Quincy Adams",      // 6
        "Andrew Jackson",         // 7
        "Martin Van Buren",       // 8
        "William Henry Harrison", // 9
        "John Tyler",             //10
        "James K. Polk",          //11
        "Zachary Taylor",         //12
        "Millard Fillmore",       //13
        "Franklin Pierce",        //14
        "James Buchanan",         //15
        "Abraham Lincoln",        //16
        "Andrew Johnson",         //17
        "Ulysses S. Grant",       //18
        "Rutherford B. Hayes",    //19
        "James A. Garfield",      //20
        "Chester A. Arthur",      //21
        "Grover Cleveland",       //22 (non-consecutive)
        "Benjamin Harrison",      //23
        "Grover Cleveland",       //24 (non-consecutive)
        "William McKinley",       //25
        "Theodore Roosevelt",     //26
        "William Howard Taft",    //27
        "Woodrow Wilson",         //28
        "Warren G. Harding",      //29
        "Calvin Coolidge",        //30
        "Herbert Hoover",         //31
        "Franklin D. Roosevelt",  //32
        "Harry S. Truman",        //33
        "Dwight D. Eisenhower",   //34
        "John F. Kennedy",        //35
        "Lyndon B. Johnson",      //36
        "Richard Nixon",          //37
        "Gerald Ford",            //38
        "Jimmy Carter",           //39
        "Ronald Reagan",          //40
        "George H. W. Bush",      //41
        "Bill Clinton",           //42
        "George W. Bush",         //43
        "Barack Obama",           //44
        "Donald Trump"            //45
    ];
    
    let vicePresidents: Set<String> = [
        "John Adams",             // 1
        "Thomas Jefferson",       // 2
        "Aaron Burr",             // 3
        "George Clinton",         // 4
        "Elbridge Gerry",         // 5
        "Daniel D. Tompkins",     // 6
        "John C. Calhoun",        // 7
        "Martin Van Buren",       // 8
        "Richard M. Johnson",     // 9
        "John Tyler",             //10
        "George M. Dallas",       //11
        "Millard Fillmore",       //12
        "William R. King",        //13
        "John C. Breckinridge",   //14
        "Hannibal Hamlin",        //15
        "Andrew Johnson",         //16
        "Schuyler Colfax",        //17
        "Henry Wilson",           //18
        "William A. Wheeler",     //19
        "Chester A. Arthur",      //20
        "Thomas A. Hendricks",    //21
        "Levi P. Morton",         //22
        "Adlai Stevenson",        //23
        "Garret Hobart",          //24
        "Theodore Roosevelt",     //25
        "Charles W. Fairbanks",   //26
        "James S. Sherman",       //27
        "Thomas R. Marshall",     //28
        "Calvin Coolidge",        //29
        "Charles G. Dawes",       //30
        "Charles Curtis",         //31
        "John N. Garner",         //32
        "Henry A. Wallace",       //33
        "Harry S. Truman",        //34
        "Alben W. Barkley",       //35
        "Richard Nixon",          //36
        "Lyndon B. Johnson",      //37
        "Hubert Humphrey",        //38
        "Spiro Agnew",            //39
        "Gerald Ford",            //40
        "Nelson Rockefeller",     //41
        "Walter Mondale",         //42
        "George H. W. Bush",      //43
        "Dan Quayle",             //44
        "Al Gore",                //45
        "Dick Cheney",            //46
        "Joe Biden",              //47
        "Mike Pence"              //48
    ];

    @IBOutlet weak var segmentedControl: UISegmentedControl!;
    
    override func viewDidLoad() {
        super.viewDidLoad();

        segmentedControl.selectedSegmentIndex = 0;   //VP only
        updateUI(segmentedControl.selectedSegmentIndex);

        // Uncomment the following line to preserve selection between presentations
        // clearsSelectionOnViewWillAppear = false;

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // navigationItem.rightBarButtonItem = editButtonItem;
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel!.text = model[indexPath.row];
        return cell;
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true;
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade);
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true;
    }
    */

    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        updateUI(sender.selectedSegmentIndex);
    }
    
    func updateUI(_ i: Int) {
        let set: Set<String>;

        switch i {
        case 0:
            set = vicePresidents.subtracting(presidents);
        case 1:
            set = presidents.intersection(vicePresidents);
        case 2:
            set = presidents.subtracting(vicePresidents);
        default:
            fatalError("bad argument \(i)");
        }
        
        model = [String](set);   ///Convert the set of strings to an array of strings.
        
        model.sort {
            let  left: [Substring] = $0.split(separator: " ");
            let right: [Substring] = $1.split(separator: " ");
            if left.last != right.last {
                return left.last! < right.last!;
            }
            return left.first! < right.first!;
        }
        
        tableView.reloadData();
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
