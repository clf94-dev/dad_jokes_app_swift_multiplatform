//
//  ComplicationController.swift
//  Dad Jokes Watchkit Watch App
//
//  Created by Carmen Lucas on 16/7/23.
//

import ClockKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    func complicationDescriptors() async -> [CLKComplicationDescriptor] {
        [
        CLKComplicationDescriptor(
            identifier: "com.carmenlucas.Dad-Jokes",
            displayName: "Dad Jokes",
            supportedFamilies: [
                .circularSmall,
                .modularSmall,
                .utilitarianSmall,
                .graphicCorner,
                .graphicCircular,
                .graphicExtraLarge
            ])
        ]
    }

    func localizableSampleTemplate(for complication: CLKComplication) async -> CLKComplicationTemplate? {
        guard let fullColorImage = UIImage(named: "fullColorImage"),
              let onePieceImage = UIImage(named: "onePieceImage")
        else {
            return nil
        }
        switch complication.family {
        case .circularSmall:
            let template = CLKComplicationTemplateCircularSmallSimpleImage(imageProvider: .init(onePieceImage: onePieceImage))
            return template
        case .modularSmall:
            let template = CLKComplicationTemplateModularSmallSimpleImage(imageProvider: .init(onePieceImage: onePieceImage))
            return template
        case .utilitarianSmall:
            let template = CLKComplicationTemplateUtilitarianSmallSquare(imageProvider: .init(onePieceImage: onePieceImage))
            return template
        case .graphicCorner:
            let template = CLKComplicationTemplateGraphicCornerCircularImage(imageProvider: .init(fullColorImage: fullColorImage))
            return template
        case .graphicCircular:
            let template = CLKComplicationTemplateGraphicCircularImage(imageProvider: .init(fullColorImage: fullColorImage))
            return template
        case .graphicExtraLarge:
            let template = CLKComplicationTemplateGraphicExtraLargeCircularImage(imageProvider: .init(fullColorImage: fullColorImage))
            return template
        default:
            return nil
        }
    }
    
    func currentTimelineEntry(for complication: CLKComplication) async -> CLKComplicationTimelineEntry? {
        guard let fullColorImage = UIImage(named: "fullColorImage"),
              let onePieceImage = UIImage(named: "onePieceImage")
        else {
            return nil
        }
        switch complication.family {
        case .circularSmall:
            let template = CLKComplicationTemplateCircularSmallSimpleImage(imageProvider: .init(onePieceImage: onePieceImage))
            return .init(date: Date(), complicationTemplate: template)
        case .modularSmall:
            let template = CLKComplicationTemplateModularSmallSimpleImage(imageProvider: .init(onePieceImage: onePieceImage))
            return .init(date: Date(), complicationTemplate: template)
        case .utilitarianSmall:
            let template = CLKComplicationTemplateUtilitarianSmallSquare(imageProvider: .init(onePieceImage: onePieceImage))
            return .init(date: Date(), complicationTemplate: template)
        case .graphicCorner:
            let template = CLKComplicationTemplateGraphicCornerCircularImage(imageProvider: .init(fullColorImage: fullColorImage))
            return .init(date: Date(), complicationTemplate: template)
        case .graphicCircular:
            let template = CLKComplicationTemplateGraphicCircularImage(imageProvider: .init(fullColorImage: fullColorImage))
            return .init(date: Date(), complicationTemplate: template)
        case .graphicExtraLarge:
            let template = CLKComplicationTemplateGraphicExtraLargeCircularImage(imageProvider: .init(fullColorImage: fullColorImage))
            return .init(date: Date(), complicationTemplate: template)
        default:
            return nil
        }
    }

}
