use std::fs;

fn main() {
    // read input file to string
    let input = fs::read_to_string("./input.txt").unwrap();

    // parse input string to Vec<usize>
    // element stands for an elf and its entries represent
    // the elves food supply
    let mut sum: usize = 0;
    let mut group_supply: Vec<usize> = Vec::new();
    for item in input.lines() {
        if item.is_empty() {
            group_supply.push(sum);
            sum = 0;
        } else {
            let calories = item.parse::<usize>().unwrap();
            sum += calories;
        }
    }
    
    // print the elf with the most supply and the sum of the calories
    group_supply.sort();
    let fst = group_supply.pop().unwrap();
    let snd = group_supply.pop().unwrap();
    let thd = group_supply.pop().unwrap();
    println!("1. {}\n2. {}\n3. {}", fst, snd, thd);
    println!("Total: {}", fst + snd + thd);
}
