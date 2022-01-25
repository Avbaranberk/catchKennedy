//
//  ViewController.swift
//  catchKennedy
//
//  Created by Baran Berk Kılıç on 25.01.2022.
//

//My forth day on İos challange. Let's see how much I can improve myself in 3-4 months. // İos challange'da dördüncü günüm. Bakalım 3-4 ayda kendimi ne kadar geliştirebileceğim.

import UIKit

class ViewController: UIViewController {
    
    //"global variables section" => [eng] we should write this variables under the class of viewcontroller globally because of we need them every local code block. [tr] tüm local kod bloklarında bu değişkenlere ihtiyacımız olduğu için bu değişkenleri global bir şekilde view vontroller class'ı altında yazmalıyız.
    
    var score = 0
    var time = Timer ()
    var counter = 0
    var kennedyArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    var imageView = UIImage(named: "kennedyEasyMode")
    
    //label view section
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
   
    // kennedy image view section
    @IBOutlet weak var kennedy1: UIImageView!
    @IBOutlet weak var kennedy2: UIImageView!
    @IBOutlet weak var kennedy3: UIImageView!
    @IBOutlet weak var kennedy4: UIImageView!
    @IBOutlet weak var kennedy5: UIImageView!
    @IBOutlet weak var kennedy6: UIImageView!
    @IBOutlet weak var kennedy7: UIImageView!
    @IBOutlet weak var kennedy8: UIImageView!
    @IBOutlet weak var kennedy9: UIImageView!
    @IBOutlet weak var kennedy10: UIImageView!
    @IBOutlet weak var kennedy11: UIImageView!
    @IBOutlet weak var kennedy12: UIImageView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        //High Score check point => [eng] we will use this section "userdefaults methods" that given us due to easy storage little data by xcode for store player's high score [tr] bu bölümde oyuncunun en yüksek puan bilgilerini depolamak için bize xcode tarafından küçük bilgileri kolay depo etmek için verilen "userdefaults metodunu" kullacağız.
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        if let newscore = storedHighScore as? Int {
            highScore = newscore
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        // İmage interaction section => [eng] we will images interactive for users that means when they clicked on images this available for user so they can scored. [tr] fotoğrafları interaktif hale getireceğiz yani fotoğraflara basabileceksiniz bu özellik kullanıcılar için uygun olacak yani fotolara bastığınızda score yapabileceksiniz.
        kennedy1.isUserInteractionEnabled = true
        kennedy2.isUserInteractionEnabled = true
        kennedy3.isUserInteractionEnabled = true
        kennedy4.isUserInteractionEnabled = true
        kennedy5.isUserInteractionEnabled = true
        kennedy6.isUserInteractionEnabled = true
        kennedy7.isUserInteractionEnabled = true
        kennedy8.isUserInteractionEnabled = true
        kennedy9.isUserInteractionEnabled = true
        kennedy10.isUserInteractionEnabled = true
        kennedy11.isUserInteractionEnabled = true
        kennedy12.isUserInteractionEnabled = true
        
        // [eng] after that we have to ıdentify and add gesture recognizer to images // [tr] bundan sonra fotolara hareket algılayıcısını tanımlamamız ve eklememiz gerekiyor.
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore)) // [eng]  firstly we have to say self on target that means viewcontroller itselfs and after that we have to say #selector and create objc func in it on action section after that at UItapGestureRecognizer methods. [tr] UItapGestureRecognizer metodunda ilk olarak self dememiz gerekiyor bu viewcontrollerın demek ve sonrasında action bölümünde de #selector dememiz ve içine objc fonksiyonu oluşturmamız gerekiyor.
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer10 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        // [eng] we've ıdentified gesture recognizer so that we can skip add gesture recognizer section. // [tr] hareket algılayıcısını tanımladık böylece hareket algılayıcısını ekleme bölümüne geçebiliriz.
        
        kennedy1.addGestureRecognizer(recognizer1)
        kennedy2.addGestureRecognizer(recognizer2)
        kennedy3.addGestureRecognizer(recognizer3)
        kennedy4.addGestureRecognizer(recognizer4)
        kennedy5.addGestureRecognizer(recognizer5)
        kennedy6.addGestureRecognizer(recognizer6)
        kennedy7.addGestureRecognizer(recognizer7)
        kennedy8.addGestureRecognizer(recognizer8)
        kennedy9.addGestureRecognizer(recognizer9)
        kennedy10.addGestureRecognizer(recognizer10)
        kennedy11.addGestureRecognizer(recognizer11)
        kennedy12.addGestureRecognizer(recognizer12)
        
        // [eng] we have to create kennedys array due to use hidden func. [tr] hidden fonksiyonunda kullanabilmemiz için kennedy array'i oluşturmamız gerekiyor.
        
        kennedyArray = [kennedy1, kennedy2, kennedy3, kennedy4, kennedy5, kennedy6, kennedy7, kennedy8, kennedy9, kennedy10, kennedy11, kennedy12]
        
        // Timers section : we create timers in the viewdidload func that we can see the timers. // timers bölümü: timerları viewload fonksiyonun altında oluşturuyoruz ki böylece timersları görebiliyoruz.
        
        counter = 30
        timeLabel.text = String(counter) // [eng] we have to counter variable convert ınt to string because all label's text are string. [tr] tüm label tekstleri string olduğu için counter değişkenini ınt'den string'e çevirmemiz gerekiyor.
        
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(hideKennedy), userInfo: nil, repeats: true)
        
        hideKennedy() // we have to call this func for when we first open the app we dont see all kennedys.
        
    }

    // [eng] we have to create function out of view load function but in class. // [tr] fonksiyoları view load fonksiyonunun dışında fakat sınıfın içinde oluşturmamız gerekiyor.
    
    // [eng] we are creating following function for increasing score and we will use this func in above UItapGestureRecognizer's action section // [tr] aşağıdaki fonksyonu skoru arttırmak için oluşturuyoruz ve bu fonksiyonu yukarıdaki UItapGestureRecognizer'ın action bölümü içinde kullanacağız.
    
    
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    @objc func hideKennedy() {
        for kennedy in kennedyArray {
            kennedy.isHidden = true // isHidden is objc func came to us with xcode // isHidden bize xcode ile birlikte gelen objc fonksiyonudur.
        }
        let random = Int.random(in: 0...kennedyArray.count-1) //[eng]we substract 1 because the index number starts from 0. [tr] index numarası 0 dan başladığı için 1 eksiltiyoruz.
        kennedyArray[random].isHidden = false
        // [eng]this is generate a random number and this random number equal index numbers of kennedyArray and after that we did this that isHidden turn into false due to kennedys(which random index number) turn into hidden to visible.
        // [tr]bu random numaralar üretiyor ve bu random numaralar kennedyArray'in index numaralarına karşılık geliyor ve sonra ishidden'ı false çeviriyoruz ki random numaraya karşılık gelen index numarasındaki kennedy görünür olsun.
        
        // you can generate random number another way. // random numaraları başka bir yolla da oluşturabilirsiniz.
        
        // let random = Int(arc4random_uniform(UInt32(kennedyArray.count-1)))
        
        // [eng]I've choosed first way because I think the first way better than second way. Firstly second way generate random number Unıt32 and you have to convert this number Int and this is my personal idea but second way is look more complicated than first way.
        //[tr] random numaraları il yolla oluşturuyorum çünkü bence ikinci yoldan daha iyi. İlk olarak ikinci yolda ürettiğiniz random numaralar unıt32 olarak üretiliyor ve bunu inte çevirmeniz gerek ve ayrıca tabi bu benim şahsi görüşüm ikinci yoldaki kod bana daha karışık geliyor.
    }
    @objc func countDown() {
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            time.invalidate() // we have to do this due to stop the timer  // timerı durdurmak için bunu yapmak zorundayız.
            hideTimer.invalidate()
            
            for kennedy in kennedyArray {
                kennedy.isHidden = true // hides kennedys when times up // süre bittiğinde kennedyleri görünmez yapıyor.
            }
        // High Score section
            
            // we say self because we idenify which variables are our variables that we create firstly in global.
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "High Score: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore") // we call first key that we create before "highscore"
                
            }
            // alert section
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again ?", preferredStyle: UIAlertController.Style.alert)
            let Okbutton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
                // we are creating replay function like that if we say handler nil that means we dont want any action happen when users clicked that button but if we want to when users clicked button that means some action will happen and we have to write function for this. and we can write this function exact like that.
                // we have to reset all settings because of replay the game.
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)" // self deadly important for this. we have to remin to machine we call counter,score or another variables in the class.
                self.counter = 30
                self.timeLabel.text = String(self.counter)
                
                self.time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.hideKennedy), userInfo: nil, repeats: true) // so importan if you dont slef thing you cant run the app.
                
            }
            // and we have to add action for that we create function above
            
            alert.addAction(Okbutton)
            alert.addAction(replayButton)
             // and we have to call the present method for it to be appear.
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
}

