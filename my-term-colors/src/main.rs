use serde::{Deserialize, Serialize};
use std::{env, process};

fn main() {
    let args = env::args().skip(1).collect::<Vec<String>>();
    let format = if args.len() != 0 { &args[0] } else { "json" };

    match format {
        "json" => {
            let json = serde_json::to_string_pretty(&TERM_COLORS).unwrap();
            println!("{}", json);
        }
        "yaml" => {
            let yaml = serde_yml::to_string(&TERM_COLORS).unwrap();
            println!("{}", yaml);
        }
        "toml" => {
            let toml = basic_toml::to_string(&TERM_COLORS).unwrap();
            println!("{}", toml);
        }
        _ => {
            eprintln!("Invalid format. Available formats: {:?}", AVAILABLE_FORMATS);
            process::exit(1);
        }
    }
}

#[derive(Serialize, Deserialize)]
struct Colors {
    black: &'static str,
    blue: &'static str,
    cyan: &'static str,
    green: &'static str,
    magenta: &'static str,
    red: &'static str,
    white: &'static str,
    yellow: &'static str,
}

#[derive(Serialize, Deserialize)]
struct TermsColors {
    background: &'static str,
    foreground: &'static str,
    normal: Colors,
    bright: Colors,
}

static TERM_COLORS: TermsColors = TermsColors {
    background: "#1c1c1c",
    foreground: "#feffff",
    normal: Colors {
        black: "#676965",
        blue: "#83afd8",
        cyan: "##37e5e7",
        green: "#a6e35f",
        magenta: "#b867ac",
        red: "#f55b51",
        white: "#f1f1ef",
        yellow: "#fcea60",
    },
    bright: Colors {
        black: "#676965",
        blue: "#83afd8",
        cyan: "##37e5e7",
        green: "#a6e35f",
        magenta: "#b867ac",
        red: "#f55b51",
        white: "#f1f1ef",
        yellow: "#fcea60",
    },
};

static AVAILABLE_FORMATS: [&str; 3] = ["json", "yaml", "toml"];
