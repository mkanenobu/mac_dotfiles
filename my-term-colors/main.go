package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"github.com/pelletier/go-toml/v2"
	"gopkg.in/yaml.v3"
	"os"
)

type Colors struct {
	Black   string `json:"black" yaml:"black" toml:"black"`
	Blue    string `json:"blue" yaml:"blue" toml:"blue"`
	Cyan    string `json:"cyan" yaml:"cyan" toml:"cyan"`
	Green   string `json:"green" yaml:"green" toml:"green"`
	Magenta string `json:"magenta" yaml:"magenta" toml:"magenta"`
	Red     string `json:"red" yaml:"red" toml:"red`
	White   string `json:"white" yaml:"white" toml:"white"`
	Yellow  string `json:"yellow" yaml:"yellow" toml:"yellow"`
}

type TermsColors struct {
	Background string `json:"background" yaml:"background" toml:"background"`
	Foreground string `json:"foreground" yaml:"foreground" toml:"foreground"`
	Normal     Colors `json:"normal" yaml:"normal" toml:"normal"`
	Bright     Colors `json:"bright" yaml:"bright" toml:"bright"`
}

var TERM_COLORS = TermsColors{
	Background: "#1c1c1c",
	Foreground: "#feffff",
	Normal: Colors{
		Black:   "#676965",
		Blue:    "#83afd8",
		Cyan:    "##37e5e7",
		Green:   "#a6e35f",
		Magenta: "#b867ac",
		Red:     "#f55b51",
		White:   "#f1f1ef",
		Yellow:  "#fcea60",
	},
	Bright: Colors{
		Black:   "#676965",
		Blue:    "#83afd8",
		Cyan:    "##37e5e7",
		Green:   "#a6e35f",
		Magenta: "#b867ac",
		Red:     "#f55b51",
		White:   "#f1f1ef",
		Yellow:  "#fcea60",
	},
}

var AVAILABLE_FORMATS = []string{"json", "yaml", "toml"}

func main() {
	args := os.Args[1:]

	format := "json"
	if len(args) != 0 {
		format = args[0]
	}

	switch format {
	case "json":
		fmt.Println(jsonStringify())
	case "yaml":
		fmt.Println(yamlStringify())
	case "toml":
		fmt.Println(tomlStringify())
	default:
		fmt.Println("Invalid format. Available formats are: ", AVAILABLE_FORMATS)
	}
}

func jsonStringify() string {
	r, err := json.MarshalIndent(TERM_COLORS, "", "  ")
	if err != nil {
		panic(err)
	}

	return string(r)
}

func yamlStringify() string {
	buf := bytes.NewBufferString("")
	e := yaml.NewEncoder(buf)
	e.SetIndent(2)
	err := e.Encode(TERM_COLORS)
	if err != nil {
		panic(err)
	}
	return string(buf.Bytes())
}

func tomlStringify() string {
	r, err := toml.Marshal(TERM_COLORS)
	if err != nil {
		panic(err)
	}
	return string(r)
}
