.class final synthetic Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$22;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# static fields
.field private static final instance:Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$22;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$22;

    invoke-direct {v0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$22;-><init>()V

    sput-object v0, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$22;->instance:Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$22;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    sget-object v0, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$22;->instance:Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$22;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static {p1, p2}, Lcom/vk/attachpicker/screen/EditorScreen;->lambda$finish$21(Landroid/content/DialogInterface;I)V

    return-void
.end method
