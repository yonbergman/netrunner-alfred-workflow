require 'json'
require 'hashie'

class CardFinder
  FILENAME = 'cards'

  def initialize
    @cards = JSON.parse(open(FILENAME, "r:UTF-8").read()).map{|x| Hashie::Mash.new(x)}
  end

  def run(alfred, query)
    query ||= ''
    feedback = alfred.feedback
    @cards.each do |card|
      feedback.add_item(card_to_item(card))
    end
    feedback.to_alfred(query)
  end

  def card_to_item(card)
    {
      :uid      => card.code,
      :title    => card.title + extra_for_title(card),
      :subtitle => [card.type, card.subtype, card.text.gsub(/<\/?strong>/, '').gsub(/<\/?sup>/, ' ').gsub('&ndash;','-')].reject{|e| e.nil? or e.empty? }.join(' - '),
      :arg      => card.url,
      :icon     => { :type => 'default', :name => "./images/#{icon_for_faction(card)}.png" },
      :match?       => :all_title_match?
    }
  end

  def extra_for_title(card)
    " #{agenda(card) || influence(card)}"
  end

  def agenda(card)
    return nil unless card.type == "Agenda"
    return "- #{card.advancementcost}/#{card.agendapoints}"
  end

  def influence(card)
    if card.factioncost
      '•' * card.factioncost
    else
      nil
    end
  end

  def icon_for_faction(card)
    case(card.faction)
    when 'Anarch' then 'anar'
    when 'Criminal' then 'crim'
    when 'Shaper' then 'shape'

    when 'Haas-Bioroid' then 'hb'
    when 'Jinteki' then 'jin'
    when 'NBN' then 'nbn'
    when 'Weyland Consortium' then 'w'

      when 'Neutral'
        case card.side
          when 'Runner' then 'runner'
          when 'Corp' then 'corp'

      end
    end
  end
end
