comments = "Bacon ipsum dolor amet porchetta sausage ball tip, venison tongue spare ribs pork picanha short ribs. Filet mignon pork t-bone tongue burgdoggen ribeye buffalo pancetta rump swine ham. Frankfurter doner landjaeger bacon, tri-tip biltong chuck prosciutto. Biltong swine pork, beef doner strip steak pancetta pork belly tail ham ground round porchetta. Chicken jowl corned beef hamburger pastrami, tongue turducken salami porchetta shankle shoulder.
Shoulder venison capicola prosciutto beef leberkas. Pommy ipsum nosh I bid you good day Bad Wolf trouble and strife golly gosh, red telephone box whizz slap-head Victoria sponge cake scarper. Dr. Watson 'ar kid odds and sods getting on my wick toad in the whole unhand me sir, Moriarty Bob's your uncle god save the queen conkers. Wibbly-wobbly timey-wimey stuff stupendous narky some mothers do 'ave 'em upper class, naff off argy-bargy could be a bit of a git, what a doddle dignified jolly hockey sticks. They can sod off a right royal knees up hard cheese old boy the chippy spiffing supper cotton on, fried toast easy peasy a right royal knees up hedgehog Dr. Watson, 10 pence mix goggledegook a tad dignified got his end away. Alcatra kielbasa frankfurter, kevin porchetta jerky sirloin pastrami shank biltong rump fatback turducken andouille. Kevin ribeye venison t-bone, bresaola burgdoggen ball tip sausage alcatra filet mignon turducken pancetta kielbasa. Chuck salami bresaola pork chop short ribs sirloin shoulder strip steak short loin meatloaf. Fatback burgdoggen kevin pork belly corned beef drumstick. Turkey tri-tip tenderloin pork belly bacon burgdoggen andouille buffalo doner bresaola strip steak. Short ribs prosciutto venison t-bone tail biltong hamburger salami andouille ribeye doner ball tip swine shankle.Chicken beef meatloaf turducken, jowl alcatra ground round frankfurter tenderloin pork loin pig porchetta pork ham salami. Drumstick pork loin picanha alcatra turkey. Prosciutto beef hamburger, buffalo rump pork belly burgdoggen strip steak chicken jowl. Brisket salami meatball, andouille shank pork belly jerky. The carbon in our apple pies, birth dream of the mind's eye inconspicuous motes of rock and gas made in the interiors of collapsing stars, finite but unbounded a mote of dust suspended in a sunbeam consciousness! Extraordinary claims require extraordinary evidence. Galaxies star stuff harvesting star light Euclid worldlets, billions upon billions Rig Veda! Light years. White dwarf, across the centuries astonishment! Gathered by gravity, cosmos. Extraplanetary quasar from which we spring a still more glorious dawn awaits tendrils of gossamer clouds descended from astronomers ship of the imagination. Intelligent beings laws of physics, the carbon in our apple pies permanence of the stars preserve and cherish that pale blue dot paroxysm of global death extraplanetary star stuff harvesting star light Sea of Tranquility Jean-Francois Champollion, galaxies! Kindling the energy hidden in matter as a patch of light, tingling of the spine Euclid, cosmic fugue, the ash of stellar alchemy, intelligent beings the carbon in our apple pies. Network of wormholes take root and flourish? Light years the only home we've ever known. Billions upon billions inconspicuous motes of rock and gas, tesseract, descended from astronomers hundreds of thousands bits of moving fluff a mote of dust suspended in a sunbeam corpus callosum. A still more glorious dawn awaits! Star stuff harvesting star light. Courage of our questions across the centuries science at the edge of forever, light years Apollonius of Perga at the edge of forever. Two ghostly white figures in coveralls and helmets are soflty dancing, explorations made in the interiors of collapsing stars! Astonishment the carbon in our apple pies made in the interiors of collapsing stars are creatures of the cosmos kindling the energy hidden in matter, Drake Equation? Astonishment Vangelis. Light years extraplanetary, the carbon in our apple pies Hypatia the sky calls to us, tesseract take root and flourish citizens of distant epochs Drake Equation rich in mystery Hypatia.
Consciousness, star stuff harvesting star light, explorations cosmos take root and flourish! At the edge of forever vanquish the impossible network of wormholes colonies gathered by gravity. Vanquish the impossible. Rig Veda Cambrian explosion, dispassionate extraterrestrial observer not a sunrise but a galaxyrise! Great turbulent clouds, the ash of stellar alchemy. Laws of physics explorations hydrogen atoms Cambrian explosion, concept of the number one citizens of distant epochs made in the interiors of collapsing stars! Circumnavigated emerged into consciousness science circumnavigated consciousness corpus callosum science courage of our questions intelligent beings? Radio telescope? Stirred by starlight. Citizens of distant epochs and billions upon billions upon billions upon billions upon billions upon billions upon billions.".split('.')

books = Book.all
users = User.all

20.times do
  book = books.sample
  Comment.find_or_create_by!(
    {
      commentable_id: book.id,
      commentable: book,
      body: comments.sample,
      user: users.sample
    }
  )
end

30.times do
  book = books.sample

  params = {
    commentable_id: book.id,
    commentable: book,
    parent_id: book.comments.pluck(:id).sample,
    body: comments.sample,
    user: users.sample
  }

  Comment.create!(params)
end
