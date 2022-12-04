use std::fs;

fn main() {
    // read input as string
    let guide = fs::read_to_string("./input.txt").unwrap();
    p1(guide.clone());
    p2(guide);
}

fn p1(guide: String) {
    let mut total = 0;

    for round in guide.lines() {
        let mut split = round.splitn(2, ' ');

        let op = split.next().unwrap();
        let me = split.next().unwrap();

        // Rock   Paper   Scissors
        // A      B       C
        // X      Y       Z
        // 1 P    2 P     3 P

        let score = match me {
            "X" => {
                1 + match op {
                    "A" => 3,
                    "B" => 0,
                    "C" => 6,
                    _ => 0,
                }
            }
            "Y" => {
                2 + match op {
                    "A" => 6,
                    "B" => 3,
                    "C" => 0,
                    _ => 0,
                }
            }
            "Z" => {
                3 + match op {
                    "A" => 0,
                    "B" => 6,
                    "C" => 3,
                    _ => 0,
                }
            }
            _ => 0,
        };
        total += score;
    }

    println!("{}", total);
}

fn p2(guide: String) {
    let mut total = 0;

    for round in guide.lines() {
        let mut split = round.splitn(2, ' ');

        let op = split.next().unwrap();
        let round_end = split.next().unwrap();
        
        // Rock   Paper   Scissors
        // A      B       C
        // 1 P    2 P     3 P

        let score = match round_end {
            "X" => 0 + match op {
                "A" => 3,
                "B" => 1,
                "C" => 2,
                _ => 0,
            },
            "Y" => 3 + match op {
                "A" => 1,
                "B" => 2,
                "C" => 3,
                _ => 0,
            },
            "Z" => 6 + match op {
                "A" => 2,
                "B" => 3,
                "C" => 1,
                _ => 0,
            },
            _ => 0,
        };

        total += score;
    }

    println!("{}", total);
}
