#include <lauxlib.h>
#include <stdlib.h>

#include "Insights_.h"

static int insights(lua_State *L) {
  int i_max = 0;
  do {
    i_max++;
    lua_rawgeti(L, 1, i_max);
  } while (!lua_isnil(L, -1));
  const char **argv = malloc((i_max + 1) * sizeof(char *));
  argv[0] = "insights";
  for (int i = -i_max; i < 0; ++i) {
    argv[i_max + i + 1] = lua_tostring(L, i);
  }
  lua_pushstring(L, Cppinsights(i_max, argv));
  return 1;
}

static const luaL_Reg functions[] = {
    {"insights", insights},
    {NULL, NULL},
};

int luaopen_cppinsights(lua_State *L) {
#if LUA_VERSION_NUM == 501
  luaL_register(L, "cppinsights", functions);
#else
  luaL_newlib(L, functions);
#endif
  return 1;
}
