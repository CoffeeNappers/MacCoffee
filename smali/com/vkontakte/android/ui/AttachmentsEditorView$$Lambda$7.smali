.class final synthetic Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$7;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/animation/TimeInterpolator;


# static fields
.field private static final instance:Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$7;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$7;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$7;-><init>()V

    sput-object v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$7;->instance:Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$7;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Landroid/animation/TimeInterpolator;
    .locals 1

    sget-object v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$7;->instance:Lcom/vkontakte/android/ui/AttachmentsEditorView$$Lambda$7;

    return-object v0
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static {p1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->lambda$resetTransitionAnims$2(F)F

    move-result v0

    return v0
.end method
