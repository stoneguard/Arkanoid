#include "engine.h"
#include "Tiny2D.h"
#include  "rmgr.h"
#include "squall_vmstd.hpp"

using namespace Tiny2D;

namespace engine
{
   class Engine::Impl : public App::Callbacks
   {
   public:
      bool OnStartup(int numArguments, const char** arguments, const App::SystemInfo& systemInfo, App::StartupParams& outParams) override
      {
         return true;
      }

      bool OnInit() override
      {
         return true;
      }

      void OnDraw(Texture& renderTarget) override
      {

      }

      void OnUpdate(float deltaTime) override
      {

      }
   private:

   };

   Engine::Engine()
   {
      try
      {
         squall::VMStd vm;
         vm.dofile(_S("settings"));

         int n0 = vm.call<int>("foo0");
         std::cout << "**** return value: " << n0 << std::endl;

         int n1 = vm.call<int>("foo1", 7);
         std::cout << "**** return value: " << n1 << std::endl;
      }
      catch (squall::squirrel_error& e) {
         std::cerr << e.what() << std::endl;
      }

      p = new Impl;
   }

   Engine::~Engine()
   {
      delete p;
   }
}