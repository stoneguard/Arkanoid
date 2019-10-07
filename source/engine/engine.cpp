#include "engine.h"
#include "Tiny2D.h"
#include  "rmgr.h"
#include <simplesquirrel.hpp>

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
      // Create VM with stack size of 1024 and load string and math libraries
      ssq::VM vm(1024/*, ssq::Libs::STRING | ssq::Libs::MATH*/);

      try 
      {
         ssq::Script script = vm.compileFile(_S("settings"));
         vm.run(script);

         // Find class
         ssq::Class cls = vm.findClass("Settings");

         ssq::Instance clsInstance = vm.newInstance(cls);

         ssq::Function funcGetScreenWidth = cls.findFunc("GetScreenWidth");

         auto screenWidth = vm.callFunc(funcGetScreenWidth, clsInstance).toInt();


      }
      catch (ssq::CompileException& e) {
         std::cerr << "Failed to run file: " << e.what() << std::endl;
      }
      catch (ssq::TypeException& e) {
         std::cerr << "Something went wrong passing objects: " << e.what() << std::endl;
      }
      catch (ssq::RuntimeException& e) {
         std::cerr << "Something went wrong during execution: " << e.what() << std::endl;
      }
      catch (ssq::NotFoundException& e) {
         std::cerr << e.what() << std::endl;
      }

      p = new Impl;
   }

   Engine::~Engine()
   {
      delete p;
   }
}