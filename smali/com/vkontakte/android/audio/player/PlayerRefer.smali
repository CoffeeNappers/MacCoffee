.class public Lcom/vkontakte/android/audio/player/PlayerRefer;
.super Ljava/lang/Object;
.source "PlayerRefer.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;


# static fields
.field private static final CAT_FEED:I = 0x69

.field private static final CAT_GROUP_LIST:I = 0x67

.field private static final CAT_IM:I = 0x6a

.field private static final CAT_MY:I = 0x65

.field private static final CAT_OTHER:I = 0x72

.field private static final CAT_RECOMMENDS:I = 0x6b

.field private static final CAT_SEARCH:I = 0x6e

.field private static final CAT_USER_LIST:I = 0x66

.field private static final CAT_WALL_STATUS_REPLIES:I = 0x68

.field private static final REF_AUDIOS_GROUP:Ljava/lang/String; = "audios_group"

.field private static final REF_AUDIOS_USER:Ljava/lang/String; = "audios_user"

.field private static final REF_COMMENTS:Ljava/lang/String; = "comments"

.field private static final REF_MESSAGES:Ljava/lang/String; = "messages"

.field private static final REF_NEWS:Ljava/lang/String; = "news"

.field private static final REF_SEARCH:Ljava/lang/String; = "search"

.field private static final REF_STATUS:Ljava/lang/String; = "status"

.field private static final REF_WALL_GROUP:Ljava/lang/String; = "wall_group"

.field private static final REF_WALL_USER:Ljava/lang/String; = "wall_user"

.field private static final VK_CAT_FEED:Ljava/lang/String; = "feed"

.field private static final VK_CAT_GLOBAL_SEARCH:Ljava/lang/String; = "global_search"

.field private static final VK_CAT_GROUP_LIST:Ljava/lang/String; = "group_list"

.field private static final VK_CAT_GROUP_STATUS:Ljava/lang/String; = "group_status"

.field private static final VK_CAT_GROUP_WALL:Ljava/lang/String; = "group_wall"

.field private static final VK_CAT_IM:Ljava/lang/String; = "im"

.field private static final VK_CAT_MY:Ljava/lang/String; = "my"

.field private static final VK_CAT_OTHER:Ljava/lang/String; = "other"

.field private static final VK_CAT_RECS:Ljava/lang/String; = "recs"

.field private static final VK_CAT_REPLIES:Ljava/lang/String; = "replies"

.field private static final VK_CAT_USER_LIST:Ljava/lang/String; = "user_list"

.field private static final VK_CAT_USER_STATUS:Ljava/lang/String; = "user_status"

.field private static final VK_CAT_USER_WALL:Ljava/lang/String; = "user_wall"

.field public static final audios_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final audios_my:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final audios_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final comments:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final im:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final news:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final none:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final recommendation_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final recommendation_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final search:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final status_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final status_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final wall_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field public static final wall_user:Lcom/vkontakte/android/audio/player/PlayerRefer;


# instance fields
.field private final cat:I

.field private final extStr:Ljava/lang/String;

.field private final str:Ljava/lang/String;


# direct methods
.method private static $(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "cat"    # I
    .param p2, "extStr"    # Ljava/lang/String;

    .prologue
    .line 64
    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerRefer;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/audio/player/PlayerRefer;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/16 v4, 0x6b

    const/16 v3, 0x68

    .line 45
    const/4 v0, 0x0

    const/16 v1, 0x72

    const-string/jumbo v2, "other"

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->none:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 46
    const-string/jumbo v0, "status"

    const-string/jumbo v1, "user_status"

    invoke-static {v0, v3, v1}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->status_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 47
    const-string/jumbo v0, "status"

    const-string/jumbo v1, "group_status"

    invoke-static {v0, v3, v1}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->status_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 48
    const-string/jumbo v0, "search"

    const/16 v1, 0x6e

    const-string/jumbo v2, "global_search"

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->search:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 49
    const-string/jumbo v0, "messages"

    const/16 v1, 0x6a

    const-string/jumbo v2, "im"

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->im:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 50
    const-string/jumbo v0, "audios_user"

    const/16 v1, 0x66

    const-string/jumbo v2, "user_list"

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 51
    const-string/jumbo v0, "audios_group"

    const/16 v1, 0x67

    const-string/jumbo v2, "group_list"

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 52
    const-string/jumbo v0, "audios_user"

    const/16 v1, 0x65

    const-string/jumbo v2, "my"

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_my:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 53
    const-string/jumbo v0, "audios_user"

    const-string/jumbo v1, "recs"

    invoke-static {v0, v4, v1}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->recommendation_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 54
    const-string/jumbo v0, "audios_group"

    const-string/jumbo v1, "recs"

    invoke-static {v0, v4, v1}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->recommendation_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 55
    const-string/jumbo v0, "news"

    const/16 v1, 0x69

    const-string/jumbo v2, "feed"

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->news:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 56
    const-string/jumbo v0, "wall_user"

    const-string/jumbo v1, "user_wall"

    invoke-static {v0, v3, v1}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->wall_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 57
    const-string/jumbo v0, "wall_group"

    const-string/jumbo v1, "group_wall"

    invoke-static {v0, v3, v1}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->wall_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 58
    const-string/jumbo v0, "comments"

    const-string/jumbo v1, "replies"

    invoke-static {v0, v3, v1}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->comments:Lcom/vkontakte/android/audio/player/PlayerRefer;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "cat"    # I
    .param p3, "extStr"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerRefer;->str:Ljava/lang/String;

    .line 69
    iput p2, p0, Lcom/vkontakte/android/audio/player/PlayerRefer;->cat:I

    .line 70
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/PlayerRefer;->extStr:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 101
    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerRefer;

    const/16 v1, 0x72

    const-string/jumbo v2, "other"

    invoke-direct {v0, p0, v1, v2}, Lcom/vkontakte/android/audio/player/PlayerRefer;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    :goto_1
    return-object v0

    .line 89
    :sswitch_0
    const-string/jumbo v2, "messages"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v2, "news"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v2, "wall_user"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v2, "wall_group"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v2, "comments"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    .line 91
    :pswitch_0
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->im:Lcom/vkontakte/android/audio/player/PlayerRefer;

    goto :goto_1

    .line 93
    :pswitch_1
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->news:Lcom/vkontakte/android/audio/player/PlayerRefer;

    goto :goto_1

    .line 95
    :pswitch_2
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->wall_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

    goto :goto_1

    .line 97
    :pswitch_3
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->wall_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

    goto :goto_1

    .line 99
    :pswitch_4
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->comments:Lcom/vkontakte/android/audio/player/PlayerRefer;

    goto :goto_1

    .line 89
    :sswitch_data_0
    .sparse-switch
        -0x77d11436 -> :sswitch_3
        -0x23e8220c -> :sswitch_4
        -0x1b8afeb4 -> :sswitch_0
        0x338ad3 -> :sswitch_1
        0x56ffa120 -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public static parseRecommended(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 106
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerRefer;->none:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 109
    :goto_0
    return-object v0

    :cond_0
    const/16 v0, 0x6b

    const-string/jumbo v1, "recs"

    invoke-static {p0, v0, v1}, Lcom/vkontakte/android/audio/player/PlayerRefer;->$(Ljava/lang/String;ILjava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public getExtStr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerRefer;->extStr:Ljava/lang/String;

    return-object v0
.end method

.method public getInt()I
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lcom/vkontakte/android/audio/player/PlayerRefer;->cat:I

    return v0
.end method

.method public getStr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerRefer;->str:Ljava/lang/String;

    return-object v0
.end method
