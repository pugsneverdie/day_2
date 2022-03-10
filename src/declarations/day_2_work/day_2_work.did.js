export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'max_number_with_n_bits' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'nat_to_nat8' : IDL.Func([IDL.Nat], [IDL.Nat8], []),
  });
};
export const init = ({ IDL }) => { return []; };
