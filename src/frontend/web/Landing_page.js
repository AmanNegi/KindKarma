import {
  Button,
  Flex,
  Heading,
  Image,
  Stack,
  Text,
  useBreakpointValue,
} from '@chakra-ui/react';

export default function SplitScreen() {
  return (
    <Stack minH={'100vh'} direction={{ base: 'column', md: 'row' }}>
      <Flex p={8} flex={1} align={'center'} justify={'center'}>
        <Stack spacing={6} w={'full'} maxW={'lg'}>
          <Heading fontSize={{ base: '3xl', md: '4xl', lg: '5xl' }}>
            <Text
              as={'span'}
              position={'relative'}
              _after={{
                content: "''",
                width: 'full',
                height: useBreakpointValue({ base: '20%', md: '30%' }),
                position: 'absolute',
                bottom: 1,
                left: 0,
                bg: 'green.400',
                zIndex: -1,
              }}>
             KindKarma
            </Text>
            <br />{' '}
            <Text color={'green.400'} as={'span'}>
             Find Volunteer Events
            </Text>{' '}
          </Heading>
          <Text fontSize={{ base: 'md', lg: 'lg' }} color={'gray.500'}>
            A platform to make a positive change in the world.
          </Text>
          <Stack direction={{ base: 'column', md: 'row' }} spacing={4}>
          
            <Link to="/Signup">
            <Button
              rounded={'full'}
              bg={'green.400'}
              color={'white'}
              _hover={{
                bg: 'green.500',
              }}>
             Sign up
            </Button>
            </Link>
            
            <Link to="/Login">
            <Button rounded={'full'}>Sign In</Button>
            </Link>
            
          </Stack>
        </Stack>
      </Flex>
      <Flex flex={1}>
        <Image
          alt={'Login Image'}
          objectFit={'cover'}
          src={
            'https://images.squarespace-cdn.com/content/v1/5a032784fe54efc8a2b5b858/1551733162407-1A199M8XH8NY7LBCOUY8/image-asset.jpeg'
          }
        />
      </Flex>
    </Stack>
  );
}
