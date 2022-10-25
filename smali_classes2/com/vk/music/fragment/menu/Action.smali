.class Lcom/vk/music/fragment/menu/Action;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Action.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vk/music/fragment/menu/Action;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final iconRes:I

.field public final id:I

.field final stringRes:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    new-instance v0, Lcom/vk/music/fragment/menu/Action$1;

    invoke-direct {v0}, Lcom/vk/music/fragment/menu/Action$1;-><init>()V

    sput-object v0, Lcom/vk/music/fragment/menu/Action;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method constructor <init>(II)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 14
    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/vk/music/fragment/menu/Action;-><init>(III)V

    .line 15
    return-void
.end method

.method constructor <init>(III)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3, "stringRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 18
    iput p1, p0, Lcom/vk/music/fragment/menu/Action;->id:I

    .line 19
    iput p2, p0, Lcom/vk/music/fragment/menu/Action;->iconRes:I

    .line 20
    iput p3, p0, Lcom/vk/music/fragment/menu/Action;->stringRes:I

    .line 21
    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 24
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/fragment/menu/Action;->id:I

    .line 25
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/fragment/menu/Action;->iconRes:I

    .line 26
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/fragment/menu/Action;->stringRes:I

    .line 27
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vk/music/fragment/menu/Action$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vk/music/fragment/menu/Action$1;

    .prologue
    .line 8
    invoke-direct {p0, p1}, Lcom/vk/music/fragment/menu/Action;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-void
.end method


# virtual methods
.method hasTitle()Z
    .locals 2

    .prologue
    .line 30
    iget v0, p0, Lcom/vk/music/fragment/menu/Action;->stringRes:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 35
    iget v0, p0, Lcom/vk/music/fragment/menu/Action;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 36
    iget v0, p0, Lcom/vk/music/fragment/menu/Action;->iconRes:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 37
    iget v0, p0, Lcom/vk/music/fragment/menu/Action;->stringRes:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 38
    return-void
.end method
