.class public interface abstract annotation Lcom/vkontakte/android/orm/Index;
.super Ljava/lang/Object;
.source "Index.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lcom/vkontakte/android/orm/Index;
        fulltext = false
        length = 0x0L
        unique = false
    .end subannotation
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/orm/Index$MetaData;
    }
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->FIELD:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract fulltext()Z
.end method

.method public abstract length()J
.end method

.method public abstract unique()Z
.end method

.method public abstract value()Ljava/lang/String;
.end method
