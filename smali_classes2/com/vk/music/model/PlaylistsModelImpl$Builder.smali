.class public final Lcom/vk/music/model/PlaylistsModelImpl$Builder;
.super Ljava/lang/Object;
.source "PlaylistsModelImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/PlaylistsModelImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private canAddPlaylist:Z

.field private currentUser:Z

.field private final requestCreator:Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;>;"
        }
    .end annotation
.end field

.field private selectMode:Z

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 317
    .local p1, "requestCreator":Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;, "Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator<Lcom/vkontakte/android/data/VKList<Lcom/vk/music/dto/Playlist;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 318
    iput-object p1, p0, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->requestCreator:Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;

    .line 319
    return-void
.end method

.method static synthetic access$000(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl$Builder;

    .prologue
    .line 310
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->requestCreator:Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl$Builder;

    .prologue
    .line 310
    iget-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->currentUser:Z

    return v0
.end method

.method static synthetic access$200(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl$Builder;

    .prologue
    .line 310
    iget-object v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->title:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl$Builder;

    .prologue
    .line 310
    iget-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->selectMode:Z

    return v0
.end method

.method static synthetic access$400(Lcom/vk/music/model/PlaylistsModelImpl$Builder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/music/model/PlaylistsModelImpl$Builder;

    .prologue
    .line 310
    iget-boolean v0, p0, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->canAddPlaylist:Z

    return v0
.end method


# virtual methods
.method public build()Lcom/vk/music/model/PlaylistsModelImpl;
    .locals 2

    .prologue
    .line 342
    new-instance v0, Lcom/vk/music/model/PlaylistsModelImpl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vk/music/model/PlaylistsModelImpl;-><init>(Lcom/vk/music/model/PlaylistsModelImpl$Builder;Lcom/vk/music/model/PlaylistsModelImpl$1;)V

    return-object v0
.end method

.method public canAddPlaylist(Z)Lcom/vk/music/model/PlaylistsModelImpl$Builder;
    .locals 0
    .param p1, "val"    # Z

    .prologue
    .line 337
    iput-boolean p1, p0, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->canAddPlaylist:Z

    .line 338
    return-object p0
.end method

.method public currentUser(Z)Lcom/vk/music/model/PlaylistsModelImpl$Builder;
    .locals 0
    .param p1, "val"    # Z

    .prologue
    .line 322
    iput-boolean p1, p0, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->currentUser:Z

    .line 323
    return-object p0
.end method

.method public selectMode(Z)Lcom/vk/music/model/PlaylistsModelImpl$Builder;
    .locals 0
    .param p1, "val"    # Z

    .prologue
    .line 332
    iput-boolean p1, p0, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->selectMode:Z

    .line 333
    return-object p0
.end method

.method public title(Ljava/lang/String;)Lcom/vk/music/model/PlaylistsModelImpl$Builder;
    .locals 0
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 327
    iput-object p1, p0, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->title:Ljava/lang/String;

    .line 328
    return-object p0
.end method
