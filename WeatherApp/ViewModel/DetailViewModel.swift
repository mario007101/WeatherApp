import Foundation

class DetailViewModel: ObservableObject{
    @Published var weatherResult: WeatherMain?
    
    let icon = [
        "01d": "sun.max.fill",
        "02d": "cloud.sun.fill",
        "03d": "cloud.fill",
        "04d": "smoke.fill",
        "09d": "cloud.sun.rain.fill",
        "10d": "cloud.heavyrain.fill",
        "11d": "cloud.bolt.fill",
        "13d": "cloud.snow.fill",
        "50d": "text.aligncenter"
    ]
    
    let allTownsAndVillages = [
   "Ábelová",
   "Abovce",
   "Abrahám",
   "Abrahámovce",
   "Abrahámovce",
   "Abramová",
   "Abranovce",
   "Adamovské Kochanovce",
   "Adidovce",
   "Alekšince",
   "Andovce",
   "Andrejová",
   "Ardanovce",
   "Ardovo",
   "Arnutovce",
   "Báb",
   "Babie",
   "Babín",
   "Babiná",
   "Babindol",
   "Babinec",
   "Bacúch",
   "Bacúrov",
   "Báč",
   "Bačka",
   "Bačkov",
   "Bačkovík",
   "Baďan",
   "Bádice",
   "Badín",
   "Báhoň",
   "Bajany",
   "Bajč",
   "Bajerov",
   "Bajerovce",
   "Bajka",
   "Bajtava",
   "Baka",
   "Baláže",
   "Baldovce",
   "Balog nad Ipľom",
   "Baloň",
   "Baňa",
   "Banka",
   "Bánov",
   "Bánovce nad Bebravou",
   "Bánovce nad Ondavou",
   "Banská Belá",
   "Banská Bystrica",
   "Banská Štiavnica",
   "Banské",
   "Banský Studenec",
   "Bara",
   "Barca",
   "Bardejov",
   "Bardoňovo",
   "Bartošova Lehôtka",
   "Bartošovce",
   "Baška",
   "Baškovce",
   "Baškovce",
   "Bašovce",
   "Batizovce",
   "Bátka",
   "Bátorová",
   "Bátorove Kosihy",
   "Bátovce",
   "Beckov",
   "Beharovce",
   "Becherov",
   "Belá",
   "Belá",
   "Belá - Dulice",
   "Belá nad Cirochou",
   "Beladice",
   "Belejovce",
   "Belín",
   "Belina",
   "Belince",
   "Bellova Ves",
   "Beloveža",
   "Beluj",
   "Beluša",
   "Belža",
   "Beňadiková",
   "Beňadikovce",
   "Beňadovo",
   "Beňatina",
   "Beniakovce",
   "Benice",
   "Benkovce",
   "Beňuš",
   "Bernolákovo",
   "Bertotovce",
   "Beša",
   "Beša",
   "Bešeňov",
   "Bešeňová",
   "Betlanovce",
   "Betliar",
   "Bežovce",
   "Bidovce",
   "Biel",
   "Bielovce",
   "Biely Kostol",
   "Bijacovce",
   "Bílkove Humence",
   "Bíňa",
   "Bíňovce",
   "Biskupice",
   "Biskupová",
   "Bitarová",
   "Blahová",
   "Blatná na Ostrove",
   "Blatná Polianka",
   "Blatné",
   "Blatné Remety",
   "Blatné Revištia",
   "Blatnica",
   "Blažice",
   "Blažovce",
   "Blesovce",
   "Blhovce",
   "Bobot",
   "Bobrov",
   "Bobrovček",
   "Bobrovec",
   "Bobrovník",
   "Bočiar",
   "Bodíky",
   "Bodiná",
   "Bodorová",
   "Bodovce",
   "Bodružal",
   "Bodza",
   "Bodzianske Lúky",
   "Bogliarka",
   "Bohdanovce",
   "Bohdanovce nad Trnavou",
   "Boheľov",
   "Bohunice",
   "Bohunice",
   "Bohúňovo",
   "Bojná",
   "Bojnice",
   "Bojničky",
   "Boľ",
   "Boldog",
   "Boleráz",
   "Bolešov",
   "Boliarov",
   "Boľkovce",
   "Borcová",
   "Borčany",
   "Borčice",
   "Borinka",
   "Bôrka",
   "Borová",
   "Borovce",
   "Borský Mikuláš",
   "Borský Svätý Jur",
   "Borša",
   "Bory",
   "Bošáca",
   "Bošany",
   "Boťany",
   "Bottovo",
   "Bracovce",
   "Branč",
   "Branovo",
   "Bratislava - Čunovo - Mestská časť",
   "Bratislava - Devín - Mestská časť",
   "Bratislava - Devínska Nová Ves - Mestská časť",
   "Bratislava - Dúbravka - Mestská časť",
   "Bratislava - hlavné mesto Slovenskej republiky",
   "Bratislava - Jarovce - Mestská časť",
   "Bratislava - Karlova Ves - Mestská časť",
   "Bratislava - Lamač - Mestská časť",
   "Bratislava - Nové Mesto - Mestská časť",
   "Bratislava - Petržalka - Mestská časť",
   "Bratislava - Podunajské Biskupice - Mestská časť",
   "Bratislava - Rača - Mestská časť",
   "Bratislava - Rusovce - Mestská časť",
   "Bratislava - Ružinov - Mestská časť",
   "Bratislava - Staré Mesto - Mestská časť",
   "Bratislava - Vajnory - Mestská časť",
   "Bratislava - Vrakuňa - Mestská časť",
   "Bratislava - Záhorská Bystrica - Mestská časť",
   "Braväcovo",
   "Brdárka",
   "Brehov",
   "Brehy",
   "Brekov",
   "Brestov",
   "Brestov",
   "Brestov nad Laborcom",
   "Brestovany",
   "Brestovec",
   "Brestovec",
   "Bretejovce",
   "Bretka",
   "Breza",
   "Brezany",
   "Brezina",
   "Breziny",
   "Breznica",
   "Breznička",
   "Breznička",
   "Brezno",
   "Brezolupy",
   "Brezov",
   "Brezová pod Bradlom",
   "Brezovec",
   "Brezovica",
   "Brezovica",
   "Brezovička",
   "Brezovka",
   "Brežany",
   "Brhlovce",
   "Brieštie",
   "Brodské",
   "Brodzany",
   "Brunovce",
   "Brusnica",
   "Brusník",
   "Brusno",
   "Brutovce",
   "Bruty",
   "Brvnište",
   "Brzotín",
   "Buclovany",
   "Búč",
   "Bučany",
   "Budča",
   "Budikovany",
   "Budimír",
   "Budiná",
   "Budince",
   "Budiš",
   "Budkovce",
   "Budmerice",
   "Buglovce",
   "Buková",
   "Bukovce",
   "Bukovec",
   "Bukovec",
   "Bukovina",
   "Bulhary",
   "Bunetice",
   "Bunkovce",
   "Bušince",
   "Bušovce",
   "Buzica",
   "Buzitka",
   "Bystrá",
   "Bystrá",
   "Bystrany",
   "Bystré",
   "Bystričany",
   "Bystrička",
   "Byšta",
   "Bytča",
   "Bzenica",
   "Bzenov",
   "Bzince pod Javorinou",
   "Bziny",
   "Bzovík",
   "Bzovská Lehôtka",
   "Bžany",
   "Cabaj - Čápor",
   "Cabov",
   "Cakov",
   "Cejkov",
   "Cernina",
   "Cerová",
   "Cerovo",
   "Cestice",
   "Cífer",
   "Cigeľ",
   "Cigeľka",
   "Cigla",
   "Cimenná",
   "Cinobaňa",
   "Čab",
   "Čabalovce",
   "Čabiny",
   "Čabradský Vrbovok",
   "Čadca",
   "Čachtice",
   "Čajkov",
   "Čaka",
   "Čakajovce",
   "Čakanovce",
   "Čakanovce",
   "Čakany",
   "Čaklov",
   "Čalovec",
   "Čamovce",
   "Čaňa",
   "Čaradice",
   "Čáry",
   "Častá",
   "Častkov",
   "Častkovce",
   "Čata",
   "Čataj",
   "Čavoj",
   "Čebovce",
   "Čečehov",
   "Čečejovce",
   "Čechy",
   "Čechynce",
   "Čekovce",
   "Čeľadice",
   "Čeľadince",
   "Čeláre",
   "Čelkova Lehota",
   "Čelovce",
   "Čelovce",
   "Čeľovce",
   "Čenkovce",
   "Čereňany",
   "Čerenčany",
   "Čerhov",
   "Čerín",
   "Čermany",
   "Černík",
   "Černina",
   "Černochov",
   "Čertižné",
   "Červená Voda",
   "Červeňany",
   "Červenica",
   "Červenica pri Sabinove",
   "Červeník",
   "Červený Hrádok",
   "Červený Kameň",
   "Červený Kláštor",
   "České Brezovo",
   "Čičarovce",
   "Čičava",
   "Čičmany",
   "Číčov",
   "Čierna",
   "Čierna Lehota",
   "Čierna Lehota",
   "Čierna nad Tisou",
   "Čierna Voda",
   "Čierne",
   "Čierne Kľačany",
   "Čierne nad Topľou",
   "Čierne Pole",
   "Čierny Balog",
   "Čierny Brod",
   "Čierny Potok",
   "Čifáre",
   "Čiližská Radvaň",
   "Čimhová",
   "Čirč",
   "Číž",
   "Čižatice",
   "Čoltovo",
   "Čremošné",
   "Čučma",
   "Čukalovce",
   "Ďačov",
   "Dačov Lom",
   "Daletice",
   "Danišovce",
   "Ďanová",
   "Ďapalovce",
   "Dargov",
   "Davidov",
   "Debraď",
   "Dedačov",
   "Dedina Mládeže",
   "Dedinka",
   "Dedinky",
   "Dechtice",
   "Dekýš",
   "Demandice",
   "Demänovská Dolina",
   "Demjata",
   "Detrík",
   "Detva",
   "Detvianska Huta",
   "Devičany",
   "Devičie",
   "Dežerice",
   "Diaková",
   "Diakovce",
   "Diviacka Nová Ves",
   "Diviaky nad Nitricou",
   "Divín",
   "Divina",
   "Divinka",
   "Dlhá",
   "Dlhá nad Kysucou",
   "Dlhá nad Oravou",
   "Dlhá nad Váhom",
   "Dlhá Ves",
   "Dlhé Klčovo",
   "Dlhé nad Cirochou",
   "Dlhé Pole",
   "Dlhé Stráže",
   "Dlhoňa",
   "Dlžín",
   "Dobrá",
   "Dobrá Niva",
   "Dobrá Voda",
   "Dobroč",
   "Dobrohošť",
   "Dobroslava",
   "Dobšiná",
   "Dohňany",
   "Dojč",
   "Doľany",
   "Doľany",
   "Dolinka",
   "Dolná Breznica",
   "Dolná Krupá",
   "Dolná Lehota",
   "Dolná Mariková",
   "Dolná Mičiná",
   "Dolná Poruba",
   "Dolná Seč",
   "Dolná Streda",
   "Dolná Strehová",
   "Dolná Súča",
   "Dolná Tižina",
   "Dolná Trnávka",
   "Dolná Ves",
   "Dolná Ždaňa",
   "Dolné Dubové",
   "Dolné Kočkovce",
   "Dolné Lefantovce",
   "Dolné Lovčice",
   "Dolné Mladonice",
   "Dolné Naštice",
   "Dolné Obdokovce",
   "Dolné Orešany",
   "Dolné Otrokovce",
   "Dolné Plachtince",
   "Dolné Saliby",
   "Dolné Semerovce",
   "Dolné Srnie",
   "Dolné Strháre",
   "Dolné Trhovište",
   "Dolné Vestenice",
   "Dolné Zahorany",
   "Dolné Zelenice",
   "Dolný Badín",
   "Dolný Bar",
   "Dolný Harmanec",
   "Dolný Hričov",
   "Dolný Chotár",
   "Dolný Kalník",
   "Dolný Kubín",
   "Dolný Lieskov",
   "Dolný Lopašov",
   "Dolný Ohaj",
   "Dolný Pial",
   "Dolný Štál",
   "Dolný Vadičov",
   "Domadice",
   "Domaníky",
   "Domaniža",
   "Domaňovce",
   "Donovaly",
   "Drábsko",
   "Drahňov",
   "Drahovce",
   "Dravce",
   "Dražice",
   "Dražkovce",
   "Drážovce",
   "Drienčany",
   "Drienica",
   "Drienov",
   "Drienovec",
   "Drienovo",
   "Drienovská Nová Ves",
   "Drietoma",
   "Drňa",
   "Drnava",
   "Družstevná pri Hornáde",
   "Drženice",
   "Držkovce",
   "Ďubákovo",
   "Dubinné",
   "Dubnica nad Váhom",
   "Dubnička",
   "Dubník",
   "Dubno",
   "Dubodiel",
   "Dubová",
   "Dubová",
   "Dubovany",
   "Dubovce",
   "Dubové"
    ]
    
    func downloadData(lat:  Double, lon: Double){
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,hourly,alerts&appid=\(APIKey.appID)&units=metric"
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) {data, response, erorr in
            
            if let erorr = erorr {
                print("Erorr: \(erorr.localizedDescription)")
                return
            }
            
            guard let data = data else { //Unwrap
                print("Mising data!")
                return
            }
            
            if let json = try? JSONDecoder().decode(WeatherMain.self, from: data){
                DispatchQueue.main.async {
                    self.weatherResult = json
                }
            }
        }
        task.resume()
    }
    
    func dayInWeek(_ num: Int) -> String {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEE")
        let jsonDate = Date(timeIntervalSince1970: TimeInterval(num))
        let dateString = formatter.string(from: jsonDate).capitalized
        
        return dateString
    }
}
