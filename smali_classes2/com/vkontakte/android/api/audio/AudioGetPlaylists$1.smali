.class Lcom/vkontakte/android/api/audio/AudioGetPlaylists$1;
.super Lcom/vkontakte/android/data/Parser;
.source "AudioGetPlaylists.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/audio/AudioGetPlaylists;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/data/Parser",
        "<",
        "Lcom/vk/music/dto/Playlist;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/audio/AudioGetPlaylists;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/audio/AudioGetPlaylists;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylists;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$1;->this$0:Lcom/vkontakte/android/api/audio/AudioGetPlaylists;

    invoke-direct {p0}, Lcom/vkontakte/android/data/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vk/music/dto/Playlist;
    .locals 1
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 40
    new-instance v0, Lcom/vk/music/dto/Playlist;

    invoke-direct {v0, p1}, Lcom/vk/music/dto/Playlist;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$1;->parse(Lorg/json/JSONObject;)Lcom/vk/music/dto/Playlist;

    move-result-object v0

    return-object v0
.end method
