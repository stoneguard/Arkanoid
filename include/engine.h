#ifndef ENGINE_H
#define ENGINE_H

namespace engine
{
   class Engine
   {
   public:
      Engine();
      ~Engine();

   private:
      class Impl;
      Impl* p;
   };
}

#endif//ENGINE_H