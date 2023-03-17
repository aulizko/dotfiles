#!/usr/local/bin/fish

function radio -d "Control mpd daemon to listen radio stations. Use -h or --help for a more detailed description."
    if [ (count $argv) -gt 0 ]
       set -l opt $argv[1]
       switch $opt
        case lush
             echo "Playing Lush [SomaFM]"
             set opt "http://ice1.somafm.com/lush-128-aac"
        case celtic
             echo "Playing CALM RADIO - CELTIC - Sampler"
             set opt "http://184.173.142.117:3028/stream"
        case irish
             echo "Playing All Irish Radio"
             set opt "http://192.99.62.212:20142/stream"
        case highlander
             echo "Playing Highlander Radio"
             set opt "http://50.7.71.27:9657"
        case folk
             echo "Playing The Acoustics House"
             set opt "http://192.235.87.105:14764"
        case blues
             echo "Playing .113FM Big Kickin' Country"
             set opt "http://listen.shoutcast.com/113fmbigkickin-country"
        case chinese
             echo "Playing Chinese Classical Music"
             set opt "http://208.110.70.66:8202"
        case sleep
             echo "Playing Sleepbot Environmental Broadcast"
             set opt "http://sc13.shoutcaststreaming.us:8194"
        case goa
             echo "Playing PartyVibeRadio - GoaTrance"
             set opt "http://listen.radionomy.com/PARTYVIBERADIO-PsychedelicTrance-Progressive-GoaTrance"
        case alternative
             echo "Playing idobi Radio: New. Music. Unfiltered. idobi.com"
             set opt "http://198.100.125.242:80"
        case classic
             echo "Playing Venice Classic Radio Italia"
             set opt "http://109.123.116.202:8010/stream"
        case country
             echo "Playing HPR1: Traditional Classic Country from Heartland Public Radio"
             set opt "http://50.7.68.251:8708"
        case dub
             echo "Playing ~ DnBSection - Austrian DnB and Dubstyle WebRadio - MusicBase.FM"
             set opt "http://89.31.134.105:96"
        case dnb
             echo "Playing Bassdrive - Worldwide Drum and Bass Radio"
             set opt "http://50.7.129.122:8000"
        case piano
             echo "Playing GotRadio - Piano Perfect"
             set opt "http://192.152.23.242:8050"
        case reggae
             echo "Playing iAlohaRadio.com"
             set opt "http://206.190.136.212:9196/Live"
        case meditation
             echo "Playing Positively Successful"
             set opt "http://198.178.121.76:8432/stream"
        case nature
             echo "Playing Ambi Nature Radio (Sleep, Relaxation"
             set opt "http://94.23.252.14:8067/stream"
        case binaural
             echo "Playing Positively Ocean"
             set opt "http://198.178.121.76:8318/stream"
        case ambient
             echo "Playing PARTY VIBE RADIO : AMBIENT  +  CHILLOUT  +  RELAXATION"
             set opt "http://107.182.233.214:8056/stream"
        case stop
             mpc clear
             mpc stop
             return 0
        case "" -h --help
             echo "Usage: radio [genre]"
             echo "Available genres are:"
             printf "\t%s\n" "-- ambient" "-- alternative" "-- binaural" "-- blues" "-- chinese" "-- classic" "-- country" "-- dnb" "-- dub" "-- folk" "-- goa" "-- highlander" "-- irish" "-- lush" "-- meditation" "-- nature" "-- piano" "-- reggae" "-- sleep"

             return 0
        case '*'
             echo "Unknown option $opt. Use -h or --help for a more detailed description."
             return 1
    end
    mpc clear
    mpc add $opt
    mpc play
    else
	echo "No arguments given. Use -h or --help for a more detailed description."
  end
end
