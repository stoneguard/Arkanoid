#include "engine.h"
#include <memory>

using namespace engine;

int main()
{
   std::unique_ptr<Engine> inst = std::make_unique<Engine>();
   return 0;
}