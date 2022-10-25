.class public Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;
.super Ljava/lang/Object;
.source "TabsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/adapter/TabsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TabInfo"
.end annotation


# instance fields
.field public allowHorizontalScroll:Z

.field public final fragmentFactoryMethod:Lcom/vkontakte/android/functions/F0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/F0",
            "<",
            "Landroid/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field public final iconResId:I

.field public showBadge:Z

.field public final titleResId:I


# direct methods
.method public constructor <init>(IILcom/vkontakte/android/functions/F0;)V
    .locals 1
    .param p1, "iconResId"    # I
    .param p2, "titleResId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/vkontakte/android/functions/F0",
            "<",
            "Landroid/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p3, "factoryMethodFunc":Lcom/vkontakte/android/functions/F0;, "Lcom/vkontakte/android/functions/F0<Landroid/app/Fragment;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput p1, p0, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;->iconResId:I

    .line 61
    iput p2, p0, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;->titleResId:I

    .line 62
    iput-object p3, p0, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;->fragmentFactoryMethod:Lcom/vkontakte/android/functions/F0;

    .line 63
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;->allowHorizontalScroll:Z

    .line 64
    return-void
.end method

.method public constructor <init>(ZIILcom/vkontakte/android/functions/F0;)V
    .locals 0
    .param p1, "allowHorizontalScroll"    # Z
    .param p2, "iconResId"    # I
    .param p3, "titleResId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZII",
            "Lcom/vkontakte/android/functions/F0",
            "<",
            "Landroid/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 67
    .local p4, "factoryMethodFunc":Lcom/vkontakte/android/functions/F0;, "Lcom/vkontakte/android/functions/F0<Landroid/app/Fragment;>;"
    invoke-direct {p0, p2, p3, p4}, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;-><init>(IILcom/vkontakte/android/functions/F0;)V

    .line 68
    iput-boolean p1, p0, Lcom/vk/attachpicker/adapter/TabsAdapter$TabInfo;->allowHorizontalScroll:Z

    .line 69
    return-void
.end method
