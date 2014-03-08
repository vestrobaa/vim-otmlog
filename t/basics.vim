syntax on
filetype plugin on

runtime! plugin/syntax/otmlog.vim

describe '<Plug><vim-otmlog> '

    before 
        new
        set filetype=otmlog

        put! = '2014-03-08 10:48:46.533	7433608	Debug	Planning	Log data line 1'
        put = '2014-03-08 10:48:46.534	7433608	Debug	Planning	  Log data line 2 at 2014-03-08 10:48:00'
        put = '2014-03-08 10:48:46.542	10433608	Debug	Planning	Log data line 3'
        put = '2014-03-08 10:48:59.603	10433608	Debug	Planning	Log data line 4'
        put = '2014-03-08 10:48:59.605	00433608	Agent	Planning	Log data line 5'
        put = '2014-03-08 10:48:59.605	00433609	Agent	Planning	Log data line 6 [agentUtility - 1]'
        put = '2014-03-08 10:48:59.605	00433609	Agent	Planning	Log DOMAIN.123456'

    end

    after
        close!
    end

    it 'should run valid tests'
        " Check file type
        Expect &ft ==# 'otmlog'

        " Check buffer data
        normal! 1G
        Expect getline('.')[col('.')-1] ==# '2'
        normal! 2GW
        Expect getline('.')[col('.')-1] ==# '1'
        normal! 5G2W
        Expect getline('.')[col('.')-1] ==# '0'
        normal! 6G$
        Expect getline('.')[col('.')-1] ==# ']'
        normal! 7G$
        Expect getline('.')[col('.')-1] ==# '6'
    end

    it 'should syntax color an OTM date'
        normal! 1G
        Expect synIDattr(synID(line('.'), col('.'),1), "name") ==# 'otmlogDate'
        Expect synIDattr(synIDtrans(synID(line('.'), col('.'),1)), "name") ==# 'Constant'
    end

    it 'should syntax color an OTM time'
        normal! 2GW
        Expect synIDattr(synID(line('.'), col('.'),1), "name") ==# 'otmlogTime'
        Expect synIDattr(synIDtrans(synID(line('.'), col('.'),1)), "name") ==# 'Type'
    end

    it 'should syntax color an OTM comment'
        normal! 6G$
        Expect getline('.')[col('.')-1] ==# ']'
        Expect synIDattr(synID(line('.'), col('.'),1), "name") ==# 'otmlogComment'
        Expect synIDattr(synIDtrans(synID(line('.'), col('.'),1)), "name") ==# 'Ignore'
    end

    it 'should syntax color an OTM number'
        normal! 5G3E
        Expect synIDattr(synID(line('.'), col('.'),1), "name") ==# 'otmlogNumber'
        "Expect synIDattr(synIDtrans(synID(line('.'), col('.'),1)), "name") ==# 'Number'
    end

    it 'should syntax color an OTM keyword (Agent, Planning, Exception, ...)'
        normal! 2G4W
        Expect synIDattr(synID(line('.'), col('.'),1), "name") ==# 'otmlogMessageType'
        Expect synIDattr(synIDtrans(synID(line('.'), col('.'),1)), "name") ==# 'Statement'
    end

    it 'should syntax color an OTM GID'
        normal! 7G$
        Expect synIDattr(synID(line('.'), col('.'),1), "name") ==# 'otmlogGUID'
        Expect synIDattr(synIDtrans(synID(line('.'), col('.'),1)), "name") ==# 'Identifier'
    end

end
