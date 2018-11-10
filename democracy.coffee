
###
	The democratic chess engine
	Copyright (C) 2018, ecrucru

		https://github.com/ecrucru/democratic-chess/

	--------------------------------
	This program is a derivative work based on :

		Worse Chess
		Copyright (C) 2018, ecrucru
		Released under AGPL v3
		https://github.com/ecrucru/worse-chess/

	--------------------------------

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU Affero General Public License as
	published by the Free Software Foundation, either version 3 of the
	License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU Affero General Public License for more details.

	You should have received a copy of the GNU Affero General Public License
	along with this program. If not, see <http://www.gnu.org/licenses/>.

	@license
###


###
# Options
###

logFileName = 'democracy-chess.log'
enginesFolder = 'C:\\Chess\\Engines\\'
enginesCommonOptions =
	'Debug' :
		type  : 'combo'
		value : 'None'
		'var' : ['None', 'Compact', 'Full']
	'Hash' :
		type  : 'spin'
		value : 32
		min   : 0
		max   : 1024
	'Minimal ELO' :
		type  : 'spin'
		value : 1000
		min   : 500
		max   : 4000
	'MultiPV' :
		type  : 'spin'
		value : 1
		min   : 1
		max   : 12
	'OwnBook' :
		type  : 'check'
		value : yes
	'Ponder' :
		type  : 'check'
		value : no
	'Threads' :
		type  : 'spin'
		value : 1
		min   : 1
		max   : 64
engines = [
		name : 'Andscacs 0.94'
		enabled : yes
		file : enginesFolder + 'Andscacs\\andscacs.exe'
		args : []
		options :
			'Hash' : null
			'MultiPV' : null
			'Ponder' : null
			'Threads' : null
		waitForReadiness : yes
		elo : 3230
	,
		name : 'Arasan 21.1'
		enabled : yes
		file : enginesFolder + 'Arasan\\arasanx-32.exe'
		args : []
		options :
			'Hash' : null
			'MultiPV' : null
			'OwnBook' : null
			'Ponder' : null
			'Threads' : null
		waitForReadiness : yes
		elo : 3112
	,
		name : 'Booot 6.3.1'
		enabled : yes
		file : enginesFolder + 'Booot\\booot6_32.exe'
		args : []
		options :
			'Hash' : null
			'Ponder' : null
			'Threads' : null
		waitForReadiness : yes
		elo : 3256
	,
		name : 'Critter 1.6a'
		enabled : yes
		file : enginesFolder + 'Critter\\Critter_1.6a_32bit.exe'
		args : []
		options :
			'Hash' : null
			'MultiPV' : null
			'OwnBook' : null
			'Ponder' : null
			'Threads' : null
		waitForReadiness : yes
		elo : 3157
	,
		name : 'Gull 3'
		enabled : yes
		file : enginesFolder + 'Gull3\\gull3.exe'
		args : []
		options :
			'Hash' : null
			'MultiPV' : null
			'Ponder' : null
			'Threads' : null
		waitForReadiness : yes
		elo : 3191
	,
		name : 'Houdini 1.5a'
		enabled : yes
		file : enginesFolder + 'Houdini\\Houdini_15a_w32.exe'
		args : []
		options :
			'Hash' : null
			'MultiPV' : null
			'Ponder' : null
			'Threads' : null
		waitForReadiness : yes
		elo : 3169
	,
		name : 'Komodo 9.02'
		enabled : yes
		file : enginesFolder + 'Komodo\\komodo902.exe'
		args : []
		options :
			'Hash' : null
			'MultiPV' : null
			'OwnBook' : null
			'Ponder' : null
			'Threads' : null
		waitForReadiness : yes
		elo : 3337
	,
		name : 'Ruffian 1.0.5'
		enabled : yes
		file : enginesFolder + 'Ruffian\\Ruffian_105.exe'
		args : []
		options :
			'Hash' : null
			'MultiPV' : null
		waitForReadiness : yes
		elo : 2585
	,
		name : 'Rybka 2.3.2a'
		enabled : yes
		file : enginesFolder + 'Rybka\\Rybkav2.3.2a.mp.w32.exe'
		args : []
		options :
			'Hash' : null
			'Max CPUs' : enginesCommonOptions.Threads.value
			'MultiPV' : null
			'Ponder' : null
		waitForReadiness : yes
		elo : 2977
	,
		name : 'SOS 5.1'
		enabled : yes
		file : enginesFolder + 'SOS\\SOS-51_Arena.exe'
		args : []
		options :
			'Hash' : null
			'MultiPV' : null
			'OwnBook' : null
			'Ponder' : null
		waitForReadiness : yes
		elo : 2576
	,
		name : 'Spike 1.4'
		enabled : yes
		file : enginesFolder + 'Spike\\Spike1.4.exe'
		args : []
		options :
			'CPUs' : enginesCommonOptions.Threads.value
			'Hash' : null
			'MultiPV' : null
			'OwnBook' : null
		waitForReadiness : yes
		elo : 2921
	,
		name : 'Stockfish 9'
		enabled : yes
		file : enginesFolder + 'Stockfish\\sfmv.exe'
		args : []
		options :
			'Hash' : null
			'MultiPV' : null
			'Ponder' : null
			'Threads' : null
		waitForReadiness : yes
		elo : 3482
	,
		name : 'TogaII 4.0'
		enabled : yes
		file : enginesFolder + 'TogaII\\TogaII_40_gcc_w32.exe'
		args : []
		options :
			'Hash' : null
			'MultiPV' : null
			'Number of Threads' : enginesCommonOptions.Threads.value
			'OwnBook' : null
			'Ponder' : null
		waitForReadiness : yes
		elo : 2916
]


###
# Library
###

debugMessage = (pMsg) ->
	b = enginesCommonOptions.Debug.value isnt 'None'
	console.log "info string DEBUG #{pMsg}" if b
	return b

traceFiltered = (pParse) ->
	# Checks
	return true if pParse is null

	# Checks by debug level
	switch enginesCommonOptions.Debug.value
		when 'None'
			return true
		when 'Compact'
			# The current analysis of the moves generates a lot of messages
			return pParse.command is 'info' && (pParse.fields.currmove isnt null || pParse.fields.multi isnt null)
		when 'Full'
			return false
		else
			throw 'Internal error'

trace = (pCommand) ->
	b = (enginesCommonOptions.Debug.value isnt 'None') && (logFileName.length > 0)
	try
		fs.appendFileSync logFileName, "#{pCommand}\r\n" if b
	catch error
		b = false
	return b

findEngineByName = (pEngineName) ->
	return e for e in engines when e.name is pEngineName
	return null

findEngineByPId = (pEnginePId) ->
	i = 0
	for p in subp
		return engines[i] if p.pid is pEnginePId
		i++
	return null

findProcByName = (pEngineName) ->
	i = 0
	for e in engines
		return subp[i] if e.name is pEngineName
		i++
	return null

findProcByPId = (pEnginePId) ->
	return p for p in subp when p.pid is pEnginePId
	return null

resetEngineAttributes = (pEngine) ->
	# Checks
	return false if pEngine is null

	# Resets the attributes
	pEngine.bestmove = ''
	pEngine.lostVotes = 0
	pEngine.correctVotes = 0
	return true

writeToEngine = (pEngineName, pCommand) ->
	# Checks
	return false if (pEngineName is null) || (pEngineName.length is 0) || (pCommand is null) || (pCommand.length is 0)

	# Detects the engine
	proc = findProcByName pEngineName
	return false if proc is null

	# Writes to the process
	trace "** #{pEngineName} >> #{pCommand}"
	proc.stdin.write "#{pCommand}\n"
	return true

writeToGUI = (pCommand) ->
	# Checks
	return false if (pCommand is null) || (pCommand.length is 0)

	# Writes
	console.log pCommand
	trace "<< #{pCommand}"
	return true

getEngineShortName = () ->
	buffer = ''
	for e in engines when e.enabled
		# Initial letters of the engine
		name = e.name.split(' ')[0].replace(/[^A-Z]/g, '')
		if name.length < 2
			name = e.name.substring 0, 2

		# Concats the name
		buffer += '/' if buffer.length > 0
		buffer += name.substring 0, 4
	return 'Democracy' + (if buffer.length > 0 then " (#{buffer})" else '')

parseCommand = (pCommand) ->
	# Splits the command
	return null if pCommand is null or pCommand.length is 0
	list = pCommand.split ' '

	# Identifies the supported commands and their elements
	result =
		command : list[0].toLowerCase()
		fields : null
	switch result.command
		when 'uci', 'uciok', 'copyprotection', 'isready', 'readyok', 'ucinewgame', 'stop', 'quit'
			keys = []
		when 'id'
			keys = ['name', 'author', 'description']
		when 'option'
			keys = ['name', 'type', 'value', 'var', 'min', 'max', 'default']
		when 'setoption'
			keys = ['name', 'value']
		when 'position'
			keys = ['startpos', 'fen', 'moves']
		when 'go'
			keys = ['binc', 'btime', 'depth', 'infinite', 'mate', 'movestogo', 'movetime', 'nodes', 'ponder', 'searchmoves', 'winc', 'wtime']
		when 'info'
			keys = ['cpuload', 'currline', 'currmove', 'currmovenumber', 'depth', 'hashfull', 'multipv', 'nodes', 'nps', 'pv', 'refutation', 'sbhits', 'score', 'seldepth', 'string', 'tbhits', 'time']
		when 'bestmove'
			keys = ['bestmove', 'ponder']
		else
			return null												# Unsupported command

	# Prepares the result
	if keys.length > 0
		# Initializes all the expectable keys
		field = ''
		obj = {}
		for key in keys
			obj[key] = null

		# Scans each item from the command
		for i in [0..list.length-1]
			item = list[i].toLowerCase()

			# Handles the received key
			if item in keys
				field = item
				if obj[field] is null
					obj[field] = ''
				else
					if Array.isArray obj[field]
						obj[field].push ''							# Handling of the combo with a new item
					else
						obj[field] = [obj[field], '']
				continue

			# Verifies that we are updating a valid key
			if field.length is 0
				continue

			# Appends the value to the key
			if Array.isArray obj[field]
				if obj[field][obj[field].length-1].length > 0
					obj[field][obj[field].length-1] += ' '
				obj[field][obj[field].length-1] += list[i]
			else
				if obj[field].length > 0
					obj[field] += ' '
				obj[field] += list[i]
		result.fields = obj
	return result

parseToText = (pParse) ->
	# Checks
	return '' if pParse is null

	# Rebuilds the command line from its parsed elements
	output = pParse.command
	if pParse.fields isnt null
		for key in Object.keys pParse.fields
			if pParse.fields[key] isnt null
				if Array.isArray pParse.fields[key]
					for v in pParse.fields[key] when v.length > 0
						output += " #{key}" if key != pParse.command
						output += " #{v}"
				else
					output += " #{key}" if key != pParse.command
					v = pParse.fields[key]
					output += " #{v}" if v.length > 0
	return output

toEngine = (pInput) ->												# What is received from the GUI
	# Reads the received command
	parse = parseCommand pInput
	return false if parse is null
	trace "\r\n>> #{parseToText parse}"

	# Processes the special rules
	gate = no
	switch parse.command
		when 'uci'
			# Identifies the engine
			fromEngine 0, 'id name Democracy'
			fromEngine 0, 'id author https://github.com/ecrucru/democratic-chess/'
			fromEngine 0, 'id description The engine that plays the most acclaimed move'

			# Exposes the common options that apply to all the engines
			for n in Object.keys enginesCommonOptions
				buffer = "option name #{n}"
				defval = null
				for k in Object.keys enginesCommonOptions[n]
					# Detects the default value
					v = enginesCommonOptions[n][k]
					if k is 'value'
						defval = v
						continue

					# Writes the details of the option
					if Array.isArray v
						for vsub in v
							defval = vsub if defval is null			# The first entry is the default value
							buffer += " #{k} #{vsub}"
					else
						buffer += " #{k} #{v}"
				buffer += " default #{defval}" if defval isnt null
				fromEngine 0, buffer

			# Exposes the engine-dependent options
			i = 0
			for e in engines
				fromEngine 0, "option name #{i}_name type string default #{e.name}"
				fromEngine 0, "option name #{i}_enabled type check default #{e.enabled}"
				fromEngine 0, "option name #{i}_elo type spin min 0 max 4096 default #{e.elo}"
				for n in Object.keys e.options
					if !enginesCommonOptions.hasOwnProperty n
						fromEngine 0, "option name #{i}_#{n} type string default #{e.options[n]}"
				i++

			# Acknowledgement
			fromEngine 0, 'uciok'
			fromEngine 0, 'copyprotection ok'

		when 'setoption'
			b = false

			# Common options
			if enginesCommonOptions.hasOwnProperty parse.fields.name
				o = enginesCommonOptions[parse.fields.name]
				switch o.type
					when 'check'
						v = parse.fields.value is 'true'
					when 'spin'
						v = parseInt parse.fields.value
					when 'combo', 'string'
						v = parse.fields.value
					when 'button'
						v = ''
					else
						v = null
				if v isnt null
					o.value = v
					notifyOptions null, parse.fields.name
					b = true										# Some internal options are not forwarded to the engines

			# Engine-dependent options
			else
				r = parse.fields.name.match(/^([0-9]+)_(.*)$/)
				if r isnt null
					e = engines[parseInt r[1]]
					k = r[2]
					switch k
						when 'name'
							e.name = parse.fields.value
							b = true
						when 'enabled'
							e.enabled = parse.fields.value is 'true'
							b = true
						when 'elo'
							e.elo = parseInt parse.fields.value
							b = true
						else
							if e.options.hasOwnProperty k
								e.options[k] = parse.fields.value
								b = notifyOptions e.name, k

			# Notifies the success or not
			if !b
				fromEngine 0, 'info string Unknown option'
			return b

		when 'isready'
			# Deactivates the engines not having a sufficient ELO
			e.enabled = no for e in engines when e.elo < enginesCommonOptions['Minimal ELO'].value

			# Processes the readiness
			for e in engines when e.enabled
				e.ready = !e.waitForReadiness
				if !e.ready
					writeToEngine e.name, parse.command
			notifyReadyOK()
			return true

		when 'ucinewgame'
			# Shows the correct votes of the last game
			total = 0
			total += e.correctVotes for e in engines
			if total > 0
				fromEngine 0, 'info string For the last game, the correct votes are :'
				fromEngine 0, "info string - #{e.name} = #{e.correctVotes} (#{(100.0*e.correctVotes/total).toFixed(1)}%)" for e in engines

			# Shows the lost votes of the last game
			total = 0
			total += e.lostVotes for e in engines
			if total > 0
				fromEngine 0, 'info string For the last game, the lost votes are :'
				fromEngine 0, "info string - #{e.name} = #{e.lostVotes} (#{(100.0*e.lostVotes/total).toFixed(1)}%)" for e in engines when e.lostVotes > 0

			# Resets the statistics
			for e in engines
				resetEngineAttributes e

			# Notifies the engaged engines through the player name
			fromEngine 0, 'id name ' + getEngineShortName()

		when 'position'
			gate = yes
			## debugMessage pInput

		when 'go'
			gate = yes
			e.bestmove = '' for e in engines

		when 'quit'
			fromEngine 0, 'info string Closing the engines... Please wait few seconds'
			setTimeout () ->
				process.exit 0
			, 5000

	# Sends the command to the engines
	for e in engines when e.enabled || !gate
		writeToEngine e.name, parseToText parse
	return true

fromEngine = (pEnginePId, pInput) ->								# What is sent to the GUI based on what is received from the engines
	# Reads the received command
	return false if pInput.length is 0
	parse = parseCommand pInput
	if parse is null
		trace "** DROP #{pInput}"
		return false

	# Logs all the received commands
	e = findEngineByPId pEnginePId
	if (e isnt null) && !traceFiltered parse
		trace "** #{e.name} << #{parseToText parse}"

	# Processes
	switch parse.command
		when 'id', 'uciok', 'copyprotection', 'option', 'info'		# Dropped commands from engines unless raised by the main process
			if pEnginePId > 0
				return false

		when 'readyok'
			e.ready = yes if e isnt null
			notifyReadyOK()
			return true

		when 'bestmove'
			notifyBestMove pEnginePId, parse.fields.bestmove, yes
			return true

		else
			return false

	# Sends the command to the GUI
	return writeToGUI parseToText parse

notifyOptions = (pEngineName, pOptionName) ->
	b = false
	for e in engines when pEngineName is null || e.name is pEngineName
		for k in Object.keys e.options when pOptionName is null || k is pOptionName
			buffer = "setoption name #{k}"
			v = '' + if enginesCommonOptions.hasOwnProperty k then enginesCommonOptions[k].value else e.options[k]
			if v.length > 0											# Handles the type 'button'
				buffer += " value #{v}"
			writeToEngine e.name, buffer
			b = true
	return b

notifyReadyOK = () ->
	# Verifies if an engine is not ready
	ready = yes
	for e in engines when e.enabled && !e.ready
		ready = no
		break

	# Notifies the GUI
	if ready
		writeToGUI 'readyok'
	return ready

busyBestMove = no
timerBestMove = null
notifyBestMove = (pEnginePId, pBestMove, pFullCheck) ->
	if pFullCheck
		# Identifies the engine
		e = findEngineByPId pEnginePId
		return false if e is null
		## debugMessage "#{e.name} = #{pBestMove}"

		# Waits for the availability of the routine
		while busyBestMove
			;
		busyBestMove = yes
		e.bestmove = pBestMove if pBestMove.match(/^[a-h][1-8][a-h][1-8][rnbq]?$/i)

		# Activates a timeout starting from the latest received best move
		clearTimeout timerBestMove
		timerBestMove = setTimeout () ->
				notifyBestMove 0, '', no
			, 15000

		# Gets the engines that have not yet replied
		waitingFor = ''
		for e in engines when e.enabled && (e.bestmove.length is 0)
			waitingFor += ', ' if waitingFor.length > 0
			waitingFor += e.name
		if waitingFor.length > 0
			fromEngine 0, "info string Waiting for #{waitingFor}"
			busyBestMove = no
			return false

	# Updates the lost moves
	else
		e.lostVotes++ for e in engines when e.enabled && (e.bestmove.length is 0)

	# Counts the occurrence of each best move
	moves = []
	total = 0
	for e in engines when e.enabled && (e.bestmove.length > 0)
		total++
		move = null
		move = m for m in moves when m.bestmove is e.bestmove
		if move is null
			move =
				bestmove : e.bestmove
				number : 0
			moves.push move
		move.number++

	# Prepares the best move
	## debugMessage JSON.stringify moves
	if moves.length is 0
		bm = '0000'
		bm_count = total
	else
		# Sorts the best moves by descending order
		if moves.length > 1
			for i in [moves.length-1 .. 1]
				for j in [0 .. i-1]
					if moves[j+1].number > moves[j].number
						tmp = moves[j+1]
						moves[j+1] = moves[j]
						moves[j] = tmp

		# MultiPV
		maxi = Math.min enginesCommonOptions.MultiPV.value, moves.length
		if maxi > 1
			for i in [0..maxi-1]
				writeToGUI "info multipv #{i+1} pv #{moves[i].bestmove}"

		# Shows the best move
		bm_count = 0
		bm = moves[0].bestmove
		for e in engines when e.enabled && (e.bestmove is bm)
			e.correctVotes++
			bm_count++

	# Displays the best move
	if total > 0
		writeToGUI "info string The democracy voted for #{bm} at #{(100.0*bm_count/total).toFixed(0)}%"
	writeToGUI "bestmove #{bm}"
	clearTimeout timerBestMove
	busyBestMove = no
	return true


###
# Program entry point
###

# Loads the libraries
spawn = require('child_process').spawn
fs = require 'fs'
subp = []

# Main loop
main = () ->
	# Removes the unexisting engines
	for i in [engines.length-1 .. 0]
		if !fs.existsSync engines[i].file
			fromEngine 0, "info string #{engines[i].name} is dropped because the file doesn't exist"
			engines.splice i, 1
	if engines.length is 0
		fromEngine 0, 'info string No available engine. Please edit the source code of Democracy to define them.'
		return false

	# Bubble-sorts the engines by descending declared ELO because the strongest engine has the priority in case of equality
	if engines.length > 1
		for i in [engines.length-1 .. 1]
			for j in [0 .. i-1]
				if engines[j+1].elo > engines[j].elo
					tmp = engines[j+1]
					engines[j+1] = engines[j]
					engines[j] = tmp

	# Loads the engines even if they are disabled
	for e in engines
		# Adds some chess data
		e.ready = no
		resetEngineAttributes e

		# Creates the chess process
		fromEngine 0, "info string Loading #{e.name}"
		proc = spawn e.file, e.args
		subp.push proc
		proc.stdout.pid = proc.pid
		proc.stdout.lastChunk = ''
		proc.stdout.on 'data',
			(data) ->
				# Simplifies the data
				data = @lastChunk + data.toString()
				if !data.endsWith "\n"									# The last command is truncated
					p = data.lastIndexOf "\n"
					if p is -1
						@lastChunk = data
						return true
					else
						p++
						@lastChunk = data.substring p
						data = data.substring 0, p
				else
					@lastChunk = ''
				data = data.split("\r").join('')
				data = data.split("\t").join(' ')
				k = data.length
				while true
					data = data.split('  ').join(' ')
					break if data.length is k
					k = data.length

				# Reads each line
				fromEngine @pid, cmd.trim() for cmd in data.split "\n"
				return true

		# Sets the initial options for the engine
		notifyOptions e.name, null
	fromEngine 0, 'info string Load completed'

	# I/O interface
	process.title = 'The democratic chess engine by ecrucru'
	process.chdir enginesFolder
	process.on 'exit',
		(code, signal) ->
			for p in subp
				p.kill()
			return true
	process.stdin.on 'readable',
		() ->
			# Input block of data
			data = process.stdin.read()
			return false if data is null
			data = data.toString()

			# Simplifies the data
			data = data.split("\r").join('')
			data = data.split("\t").join(' ')
			k = data.length;
			while true
				data = data.split('  ').join(' ')
				break if data.length is k
				k = data.length

			# Reads each line
			toEngine cmd.trim() for cmd in data.split "\n"
			return true
	return true

main()
