SMOKERS = {vars = {}, funcs = {}, content = SMODS.current_mod}
local filesystem = NFS or love.filesystem

local config = SMOKERS.content.config

SMODS.PokerHandPart {
    key = 'horse',
    func = function(hand)
        local res = {}
        for i = 1, #hand do
            if SMODS.has_any_suit(hand[i]) then
                res[#res + 1] = hand[i]
            end
        end
        return res
    end
}

SMODS.PokerHandPart {
    key = 'horse_proper',
    func = function(hand)
        local res = {}
        for i = 1, #hand do
            if SMODS.has_any_suit(hand[i]) then
                res[#res + 1] = hand[i]
            end
        end
        return #res >= 5 and res or {}
    end
}

SMODS.PokerHand {
  key = 'Triple Horse',
  visible = true,
  chips = 50,
  mult = 0,
  l_chips = 10,
  l_mult = 5,
  example = {
    {'S_A', true, enhancement = G.P_CENTERS.m_wild},
    {'C_A', true, enhancement = G.P_CENTERS.m_wild},
    {'H_A', true, enhancement = G.P_CENTERS.m_wild},
  },
  evaluate = function(parts)
    if #parts._3 < 1 or not next(parts.smo_horse_proper) then return {} end
    return {SMODS.merge_lists(parts._3, parts.smo_horse)}
  end
}

SMODS.PokerHand{
    key = 'Full Horse',
    visible = true,
    chips = 250,
    mult = 8,
    l_chips = 30,
    l_mult = 4,
    example = {
        {'S_A', true, enhancement = G.P_CENTERS.m_wild},
        {'C_A', true, enhancement = G.P_CENTERS.m_wild},
        {'H_A', true, enhancement = G.P_CENTERS.m_wild},
        {'S_T', true, enhancement = G.P_CENTERS.m_wild},
        {'C_T', true, enhancement = G.P_CENTERS.m_wild},
    },
    evaluate = function(parts)
        if #parts._3 < 1 or #parts._2 < 2 or not next(parts.smo_horse_proper) then return {} end
        return {SMODS.merge_lists(parts._all_pairs, parts.smo_horse_proper)}
    end
}
