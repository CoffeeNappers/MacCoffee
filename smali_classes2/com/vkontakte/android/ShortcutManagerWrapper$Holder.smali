.class Lcom/vkontakte/android/ShortcutManagerWrapper$Holder;
.super Ljava/lang/Object;
.source "ShortcutManagerWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ShortcutManagerWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Holder"
.end annotation


# static fields
.field private static final INSTANCE:Lcom/vkontakte/android/ShortcutManagerWrapper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    new-instance v0, Lcom/vkontakte/android/ShortcutManagerWrapper;

    invoke-direct {v0}, Lcom/vkontakte/android/ShortcutManagerWrapper;-><init>()V

    sput-object v0, Lcom/vkontakte/android/ShortcutManagerWrapper$Holder;->INSTANCE:Lcom/vkontakte/android/ShortcutManagerWrapper;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/vkontakte/android/ShortcutManagerWrapper;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/vkontakte/android/ShortcutManagerWrapper$Holder;->INSTANCE:Lcom/vkontakte/android/ShortcutManagerWrapper;

    return-object v0
.end method
